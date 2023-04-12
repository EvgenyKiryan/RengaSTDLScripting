# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = 'Renga Lua Scripting'
copyright = '2023, Renga Software'
author = 'Eugene Kiryan'
release = '1.0'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = [
    'sphinx.ext.duration',
]

templates_path = ['_templates']
exclude_patterns = []

language = 'ru'

# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_static_path = ['_static']

# import sphinx_redactor_theme
# html_theme = 'sphinx_redactor_theme'
# html_theme_path = [sphinx_redactor_theme.get_html_theme_path()]

html_theme = 'furo'

# These paths are either relative to html_static_path
# or fully qualified paths (eg. https://...)

html_css_files = [
    'css/custom.css',
]

html_logo = "_static/logo.png"
html_title = f"Руководство {project} {release}"