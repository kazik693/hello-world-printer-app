.PHONY: test deps

deps:
	pip install -r requirements.txt; \
	pip install -r test_requirements.txt

#pip install flake8
lint:
	flake8 hello_world test

run:
	PYTHONPATH=. FLASK_APP=hello_world flask run

test:
	PYTHONPATH=. py.test --verbose -s

docker_build:
	docker build -t hello-wold-printer .

docker_run: docker_build
	docker run \
		--name hello-world-printer-dev \
			-p 5000:5000 \
			-d hello-wold-printer

test_cov:
	 	PYTHONPATH=. py.test -s --cov=.

test_xunit:
	  PYTHONPATH=. py.test -s --cov=. --junit-xml=test_requirements.txt
