# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = 'Renga Style Template Scripting'
copyright = '2023, Renga Software'
author = 'Eugene Kiryan'
release = '1.0'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = [
    'sphinx.ext.duration',
    'sphinxcontrib.luadomain',
]

templates_path = ['_templates']
exclude_patterns = []

language = 'ru'

# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_static_path = ['_static']

html_theme = 'furo'

# These paths are either relative to html_static_path
# or fully qualified paths (eg. https://...)

html_css_files = [
    'css/custom.css',
]

html_logo = '_static/logo.png'
html_title = f"Руководство {project} {release}"