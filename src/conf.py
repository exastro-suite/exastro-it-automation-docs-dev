# Configuration file for the Sphinx documentation builder.
#
# This file only contains a selection of the most common options. For a full
# list see the documentation:
# http://www.sphinx-doc.org/en/master/config

from sphinx.roles import MenuSelection

MenuSelection.BULLET_CHARACTER = '▶'

# -- Path setup --------------------------------------------------------------

# If extensions (or modules to document with autodoc) are in another directory,
# add these directories to sys.path here. If the directory is relative to the
# documentation root, use os.path.abspath to make it absolute, like shown here.
#
# import os
# import sys
# sys.path.insert(0, os.path.abspath('.'))


# -- Project information -----------------------------------------------------

project = 'Documentation'
copyright = '2019-2025 NEC Corporation'
author = 'NEC'

# The full version, including alpha/beta/rc tags
release = ''

# locale_dirs = ['locale/']
gettext_compact = False

# -- General configuration ---------------------------------------------------

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
extensions = [
    'sphinxcontrib.blockdiag',
    'sphinx_copybutton',
    'sphinx_tabs.tabs',
    'sphinx_toolbox.collapse',
    'sphinx.ext.todo',
    'sphinxcontrib.googleanalytics',
    'myst_parser'
]

# Fontpath for blockdiag (truetype font)
blockdiag_fontpath = '/usr/share/fonts/opentype/ipafont-gothic/ipagp.ttf'

# Add any paths that contain templates here, relative to this directory.
templates_path = ['_templates']

# The language for content autogenerated by Sphinx. Refer to documentation
# for a list of supported languages.
#
# This is also used if you do content translation via gettext catalogs.
# Usually you set "language" from the command line for these cases.
language = 'ja'
languages = ["ja", "en"]

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
# This pattern also affects html_static_path and html_extra_path.
exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store', "**/_*"]

# -- Options for HTML output -------------------------------------------------

# The theme to use for HTML and HTML Help pages.  See the documentation for
# a list of builtin themes.
#
html_theme = 'exastro_documents'
html_theme_path = ['.']

# Add any paths that contain custom static files (such as style sheets) here,
# relative to this directory. They are copied after the builtin static files,
# so a file named "default.css" will overwrite the builtin "default.css".
html_static_path = ['../_static']

html_css_files = [
    'exastro_documents.css',
    'swagger/swagger-ui.css',
]

html_js_files = [
    'jquery-3.6.3.min.js',
    'exastro_documents.js',
    'swagger/swagger-ui-bundle.js',
    'swagger/swagger-ui-standalone-preset.js',
]

# ソースコードを表示のリンクを非表示
html_show_sourcelink = False

# フッターのところにある「このドキュメントはSphinxで作成しました」という文言を消す。
html_show_sphinx = False

# favion
html_favicon = '../../_static/favicon.ico'

# LaTeX の docclass 設定
latex_docclass = {'manual': 'jsbook'}

# 図や表に番号を自動で振る設定
numfig = True

# Google Analytics tracking code ID
googleanalytics_id = 'UA-144561796-1'

copybutton_prompt_text = "Copied it!"

html_context = {
    'languages': {
        'ja': '日本語',
        'en': 'English'
    },
    'versions': {
        'current': '2.6',
        '2.6(current)': '2.6',
        '2.5': '2.5',
        '2.4': '2.4',
        '2.3': '2.3',
        '2.2': '2.2',
        '2.1': '2.1',
        '2.0 ': '2.0'
    }
}

source_suffix = {
    '.rst': 'restructuredtext',
    '.md': 'markdown', 
}

[extensions]
todo_include_todos = True