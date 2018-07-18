# Helpers.
MKFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
CURRENT_DIR := $(notdir $(patsubst %/,%,$(dir $(MKFILE_PATH))))

# Project name.
NAME := $(CURRENT_DIR)

# Files.
TESTS=tests/unit tests/functional

requirements:
	pip3 install --requirement requirements-dev.txt 1>/dev/null

-include requirements

check:
	flake8 --max-complexity 10 $(NAME)
	flake8 $(TESTS) tests/integration
	pydocstyle $(NAME)

pylint:
	pylint --rcfile .pylintrc $(NAME)
	pylint tests/

typecheck:
	mypy $(NAME)

tests:
	py.test -v $(TESTS)

coverage:
	py.test --cov $(NAME) --cov-report term-missing $(TESTS)

htmlcov:
	py.test --cov $(NAME) --cov-report html $(TESTS)
	rm -rf /tmp/htmlcov && mv htmlcov /tmp/
	open /tmp/htmlcov/index.html

doccheck:
	doc8 docs/source
	$(MAKE) -C docs linkcheck
	$(MAKE) -C docs html

prcheck: check pylint coverage doccheck typecheck

cleanup:
	@rm -rf .coverage
	@rm -rf .pytest_cache
