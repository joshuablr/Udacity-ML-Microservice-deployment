## The Makefile includes instructions on environment setup and lint tests
# Create and activate a virtual environment
# Install dependencies in requirements.txt
# Dockerfile should pass hadolint
# app.py should pass pylint
# (Optional) Build a simple integration test
VENV   = ~/.devops
PYTHON = python3

setup:
	# Create python virtualenv & source it
	 $(PYTHON) -m venv $(VENV)
	 
install:
	# This should be run from inside a virtualenv
	# pip install --upgrade pip &&\
	# 	pip install -r requirements.txt
	@( \
		. $(VENV)/bin/activate; \
		pip install --upgrade pip &&\
			pip install -r requirements.txt; \
		deactivate ;\
	 )
local:
	@( \
		. $(VENV)/bin/activate; \
		python3 app.py; \
		deactivate ;\
	 )
test:
	# Additional, optional, tests could go here
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	# Linux distribution of hadolint is copied inside the projec
	@./hadolint --config $(PWD)/.hadolint.yaml  Dockerfile \
	# This is a linter for Python source code linter: https://www.pylint.org/
	# This should be run from inside a virtualenv
	@( \
		. $(VENV)/bin/activate; \
		pylint --disable=R,C,W1203 app.py; \
		deactivate ;\
	)

docker: 
	@sh run_docker.sh

upload: 
	@sh upload_docker.sh

kubernetes:
	@sh run_kubernetes.sh

clean-kubernetes:
	@kubectl delete deployment udacity-prediction

clean: 
	@docker rm -f udacity-housing-prediction

all: setup install lint docker test upload