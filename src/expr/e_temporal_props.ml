(* Functions for checking temporal properties.

Copyright (C) 2013  INRIA and Microsoft Corporation
*)
open Property
open Ext
open E_t
open E_visit

module B = Builtin


let visitor = object (self : 'self)
  inherit [bool ref * bool] iter as super

  method expr ((closure, is_box), cx as scx) oe =
    if (!closure = false) then ()
    else match oe.core with
    (* constant expressions are closed *)
    (* temporal declarations are closed as well *)
    | _ when (E_constness.is_const oe) -> () (* closed if constant *)
    (* is_const is missing on some constant symbols like equality *)
    | Internal(B.Eq | B.Neq | B.UNCHANGED) -> () (* should be is_const but is not *)
    (* propositions - TRUE/FALSE  *)
    | Internal (B.TRUE | B.FALSE) -> ()
    (* unary closed operators *)
    | Apply ({core = Internal (B.Box _)}, _) when is_box -> ()
    | Apply ({core = Internal B.Diamond}, _) when (not is_box) -> ()
    (* unary operators *)
    | Apply ({core = Internal ((B.Box _) | B.Diamond | B.Prime)}, [e]) -> self#expr scx e
    | Apply ({core = Internal B.Neg}, [e]) -> self#expr ((closure, not is_box),
    cx) e
    (* binary operators *)
    | Apply ({core = Internal ((B.Conj | B.Disj | B.Implies) as tp)}, [e1;e2]) ->
        let closure1 = ref !closure in
        let closure2 = ref !closure in
        let () = match tp with
        | B.Conj | B.Disj -> self#expr ((closure1, is_box), cx) e1; self#expr ((closure2, is_box), cx) e2
        | B.Implies -> self#expr ((closure1, not is_box), cx) e1; self#expr ((closure2, is_box), cx) e2
        | _ -> assert false
        in
        closure := !closure1 && !closure2
    | Apply ({core = Internal B.Equiv}, [e1;e2]) ->
        let closure1 = ref !closure in
        let closure2 = ref !closure in
        let closure3 = ref !closure in
        let closure4 = ref !closure in
        let () = self#expr ((closure1, not is_box), cx) e1; self#expr ((closure2,
        is_box), cx) e2; self#expr ((closure3, is_box), cx) e1; self#expr
        ((closure4, not is_box), cx) e2
        in
        closure := !closure1 && !closure2 && !closure3 && !closure4
    (* lists *)
    | List (_, ls) ->
        let cls = ref !closure in
        let f e = let () = self#expr ((cls, is_box), cx) e in
        !cls in
        closure := (List.for_all f ls)
    (* decomposing formulas for confirming all are constants *)
    | Apply _ ->
        super#expr scx oe
    (* A sequent is an implication: visible assumptions at the opposite
       polarity, the conclusion at the current polarity. *)
    | Sequent sq ->
        let hyp_closed = ref !closure in
        let scx =
          Deque.fold_left begin
            fun scx h ->
              begin match h.core with
              | Fact (e, Visible, _) ->
                  self#expr ((hyp_closed, not is_box), snd scx) e
              | _ -> ()
              end ;
              adj scx h
          end ((hyp_closed, not is_box), cx) sq.context
        in
        let conc_closed = ref !closure in
        self#expr ((conc_closed, is_box), snd scx) sq.active ;
        closure := !hyp_closed && !conc_closed
    (* unexpended temporal operators *)
    | f ->
        closure := false
end

let box_closure cx e =
  let good = ref true in
  visitor#expr ((good,true), cx) e ;
  !good

let diamond_closure cx e =
  let good = ref true in
  visitor#expr ((good,false), cx) e ;
  !good


(* we should generate box-level here using a expr-visitor and replacing
 * facts (with the known cost of duplicating the context for each
 * sequent. The steps are as follows:
   * 1) if it already has a level (i.e. theorem and axioms get a box level
   * without regard to the sequent in the fact) then we do nothing
   * 2) if the fact is a formula, then we apply Leslie’s algorithm to
   * decide its level.
   * 3) if the fact is a sequent, visible assumptions are checked at
   * the opposite polarity and the conclusion at the current polarity.
   * This is sufficient: <>F is defined as ~[]~F, and box closure is
   * preserved by disjunction (Lamport, Specifying Systems, Sections
   * 8.1 and 8.2).
*)

let compute_time scx e =
  let e =
    let visitor = object (self: 'self)
      inherit E_constness.const_visitor
    end
    in
    visitor#expr ((), scx) e in
  let e = E_tla_norm.expand_unchanged ((),scx) e in
  let e = E_tla_norm.expand_action ((),scx) e in
  let e = E_tla_norm.expand_fairness ((),scx) e in
  let e = E_tla_norm.expand_leadsto ((),scx) e in
  match e.core with
| _ -> match box_closure scx e with
  | true -> Always
  | _ -> Now

let check_time_change ctx tm = match tm with
| Now -> Now
| Always -> Deque.fold_left begin
  fun acc a -> match a.core with
  | Fact(_,_,Now) -> Now
  | _ -> acc
  end Always ctx
| _ -> failwith "error"
