import setuptools

with open('README.md', 'r', encoding = 'utf-8') as fh:
  long_description = fh.read()

with open('requirements.txt', 'r') as fr:
  dependencies = fr.read().strip().split('\n')

setuptools.setup(
  name = '<placeholder>',
  version = '0.0.1',
  author = 'Antony (dimrok) Mechin',
  author_email = 'antony.mechin@gmail.com',
  description = '<placeholder>',
  long_description = long_description,
  long_description_content_type = 'text/markdown',
  url = '<placeholder>',
  packages = setuptools.find_packages(),
  classifiers = (
  ),
  install_requires = dependencies
)
