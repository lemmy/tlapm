"""Generate headers of HTML pages of TLAPS website.

To use, update `BASE_URL`, `URL`, and `menumap`.
"""
import os
import re


# TODO: change these variables to
# command-line arguments
BASE_URL = 'https://tla.msr-inria.inria.fr/'
URL = (
    'https://tla.msr-inria.inria.fr/'
    'tlaps/content')
# The menu hierarchy.
# Spaces at the beginning of the strings
# give the nesting level.
# The corresponding file/directory names
# are the same with prefixed spaces
# removed, all special characters replaced
# by underscores, and `.html`
# added at the end of file names
# (but not directories).
#
# Special characters are all characters
# except letters, digits, `-`, and `+`
#
# For the moment, the depth is limited to
# 3 levels: 0, 1, or 2 spaces.
menumap = [
    'Home',
    'Download',
    ' Binaries',
    '  Windows',
    '  Linux',
    '  MacOS',
    ' Source',
    " What's new",
    ' Unsupported',
    ' License',
    ' Previous releases',
    'Documentation',
    ' Tutorial',
    '  The example',
    '  A simple proof',
    '  Hierarchical proofs',
    '  Advanced options',
    '  Other proof constructs',
    '  Tactics',
    '  Practical hints',
    ' Unsupported features',
    ' Publications',
    ' TLA+ Hyperbook',
    ' TLA+ Video Course',
    ' Misc',
    'Community',
    ' Contact',
    ' Developers',
    ' TLA+.net']
# order of decreasing length guarantees
# that any word that is a substring of
# another will appear after it.
TLA_KEYWORDS = [
    'PROPOSITION',
    'ASSUMPTION',
    'CONSTANTS',
    'RECURSIVE',
    'UNCHANGED',
    'VARIABLES',
    'CONSTANT',
    'INSTANCE',
    'SUFFICES',
    'TEMPORAL',
    'VARIABLE',
    'ENABLED',
    'EXTENDS',
    'OBVIOUS',
    'OMITTED',
    'THEOREM',
    'WITNESS',
    'ACTION',
    'ASSUME',
    'CHOOSE',
    'DEFINE',
    'DOMAIN',
    'EXCEPT',
    'LAMBDA',
    'MODULE',
    'SUBSET',
    'AXIOM',
    'LEMMA',
    'LOCAL',
    'OTHER',
    'PROOF',
    'PROVE',
    'STATE',
    'UNION',
    'CASE',
    'DEFS',
    'ELSE',
    'HAVE',
    'HIDE',
    'ONLY',
    'PICK',
    'TAKE',
    'THEN',
    'WITH',
    'DEF',
    'LET',
    'NEW',
    'QED',
    'SF_',
    'USE',
    'WF_',
    'BY',
    'IF',
    'IN']
# NOTE:
# For this to work, the website must be
# in a directory that doesn't have
# `/content/` in its full path.
content = f'{BASE_URL}content/'
assets = f'{BASE_URL}assets/'
suffix = '.html'
# website where the generated HTML files
# will be deployed
pathstr = URL[
    len(content):len(URL) - len(suffix)]
if '\\' in pathstr:
    raise ValueError(
        '`pathstr` must not contain '
        'backslashes')
path = os.path.normpath(pathstr)
path = path.split('/')
branch = [[], [], []]
# Relative path pointing to the
# `content/` directory
base = '../' * (len(path) - 1)


def file(title):
    """Return filename associated with `title`."""
    return re.sub('[^-a-zA-Z0-9+]', '_', title)


def get_level(s):
    """Return number of spaces at beginning of `s`."""
    return len(s) - len(s.lstrip(' '))


def find_branch(index, lvl):
    """Parse the menumap array and find
    the current branch within it.
    Fill the array `branch` with the
    siblings of the current path at
    each level: `branch[level][index]` is
    the `index`-th successor of the
    `level - 1` ancestor of the path.

    @param index: current position in
        the array `menumap`
    @param lvl: current level being filled
    @return: next position in array `menumap`
    """
    while index < len(menumap):
        level = get_level(
            menumap[index])
        if level < lvl:
            return index
        elif level == lvl:
            branch[lvl].append(
                menumap[index].lstrip())
            menu_path = menumap[index].lstrip()
            if menu_path == path[lvl]:
                index = find_branch(
                    index + 1,
                    lvl + 1)
            else:
                index += 1
        else:
            index += 1
    return index


def on(prefix, depth, index):
    if path[depth] == file(branch[depth][index]):
        return f' class="{prefix}on"'
    else:
        return f' class="{prefix}off"'


LOGO_IMG = (
    'logo-MS-Research-Inria-Joint-Centre-Small.png')


TEMPLATE_1 = f'''
<div id="wrapper">
  <div id="header">
    <div id="title">
      <a class="title"
        href="{base}Home.html">
            TLA+ Proof System
      </a>
    </div>
    <div class="logomsr">
      <a href="http://www.msr-inria.inria.fr">
        <img
            src="{assets}/images/{LOGO_IMG}"
            alt="Microsoft Research - Inria Joint Centre"
            class="logo"
        />
      </a>
    </div>
  </div>
  <ul id="nav">
'''
TEMPLATE_2 = '''
</ul>
<div id="transp"></div>
<div id="content" class="clearfix">
  <div id="col_1">
'''
TEMPLATE_3 = '''
</ul>
</div>
<div id="col_2">
'''


def add_menu():
    path_0, path_1, *_ = path
    find_branch(0, 0)
    out = list()
    out.append(TEMPLATE_1)
    for item in branch[0]:
        on_ = on('', 0, i)
        out.append(
            f'''
            <li>
                <a{on_}
                    href="{base}{file(item)}.html">
                    {item}
                </a>
            </li>
            ''')
    out.append(TEMPLATE_2)
    if branch[1]:
        out.append(
            '      <h2>Menu</h2>')
    else:
        out.append(
            '      <h2 class="white">Menu</h2>')
    out.append('      <ul id="menu">')
    for i, item in enumerate(branch[1]):
        on_menu = on('menu', 1, i)
        html_path = (
            f'{base}{file(path_0)}/'
            f'{file(item)}.html')
        out.append(
            f'''
            <li{on_menu}>
                <a
                    href="{html_path}">
                    {item}
                </a>
            </li>
            ''')
        if path_1 == file(item):
            for k, title in enumerate(branch[2]):
                on_index = on('index', 2, k)
                html_path = (
                    f'{base}{file(path_0)}/'
                    f'{file(path_1)}/'
                    f'{file(title)}.html')
                out.append(
                    f'''
                    <li{on_index}>
                        <a
                            href="{html_path}">
                            {title}
                        </a>
                    </li>
                    ''')
    out.append(TEMPLATE_3)
    return '\n'.join(out)


def tla_display(tla_file):
    # TODO: implement this functionality
    tla_file = tla_get_file_comment(tla_file)
    divs = document.body.getElementsByTagName('div')
    for div in divs:
        lines = div.getAttribute('lines')
        if lines is not None:
            div.setAttribute(
                'class', 'listing sole')
            div.innerHTML = tla_get_html(lines, tla_file)
    divs = document.body.getElementsByTagName('tla')
    while divs:
        newdiv = document.createElement('code')
        copy_attributes(divs[0], newdiv)
        newdiv.innerHTML = tla_colorize(divs[0].innerHTML)
        divs[0].parentNode.replaceChild(newdiv, divs[0])


def copy_attributes(srcnode, dstnode):
    for attr in srcnode.attributes:
        dstnode.setAttribute(attr.name, attr.value)


def tla_get_file_comment(tla_file):
    divs = document.getElementsByTagName('file')
    for div in divs:
        if div.childNodes[0].nodeType == 8:
            text = div.childNodes[0].data.trim() + '\n'
            tla_file = text
            break
    return tla_file


def tla_get_html(ref, tla_file):
    descr = ref.split('/')
    tla = tla_restrict(tla_file, descr)
    return tla_html_encode(tla)


def tla_restrict(text, descr):
    if len(descr) == 1:
        if descr[0] == 'all':
            descr[0] = ''
            descr[1] = '1-99999999'
        else:
            descr[1] = '1'
    result = ''
    while len(descr) >= 2:
        startoff = text.search(
            re_escape_string(descr[0]))
        if startoff == -1:
            result += f'\\* not found: {descr[0]}'
            continue
        else:
            lines = text[startoff:].split('\n')
        ranges = descr[1].split(',')
        for points in ranges:
            points = points.split('-')
            start = int(points[0])
            if len(points) < 2:
                end = start
            else:
                end = int(points[1])
            if end >= len(lines):
                end = len(lines) - 1
            show = true
            for j in range(start, end + 1):
                if re.search(
                        lines[j - 1],
                        '/.*hide @@.*/'):
                    show = false
                if show:
                    result += lines[j - 1] + '\n'
                if re.search(
                        lines[j - 1],
                        '/.*@@ show.*/'):
                    show = true
        descr = descr[2:]
    return result


def re_escape_string(string):
    special_chars = '([[()|.\\+*?{}$^]|\])'
    res = ''
    for s in string:
        if re.search(special_chars, s):
            res = f'{res}\\'
        res += s
    return res


def tla_html_encode(text):
    text = re.sub('<', '&lt;', text)
    text = re.sub('>', '&gt;', text)
    return tla_colorize(text)


def tla_colorize(text):
    text = re.sub(
        '\(\*',
        '<span class="comment">(*',
        text)
    text = re.sub(
        '\*\)',
        '*)</span>',
        text)
    text = re.sub(
        '(\\\*.*)\n',
        # TODO: update this HTML element if needed
        '<span class="comment">$1</span>\n',
        text)
    for key in TLA_KEYWORDS:
        text = re.sub(
            key,
            f'<span class="purple">{key}</span>',
            text)
    return text


if __name__ == '__main__':
    print('This script is under development')
    menu = add_menu()
    print(menu)
