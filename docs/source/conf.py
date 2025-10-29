# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = 'Renga Style Template Scripting'
copyright = '2025, Renga Software'
author = 'Eugene Kiryan'
release = '3.0'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = [
    'sphinx.ext.duration',
    'sphinxcontrib.luadomain',
    'sphinx_design',
    'sphinx_copybutton',
]

templates_path = ['_templates']
exclude_patterns = []

language = 'ru'

# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_static_path = ['_static']

html_theme = 'furo'

html_favicon = '_static/favicon.png'

# These paths are either relative to html_static_path
# or fully qualified paths (eg. https://...)

html_css_files = [
    'css/custom.css',
]

html_logo = '_static/RengaProfessional_logo.svg'
html_title = f"Руководство {project} {release}"