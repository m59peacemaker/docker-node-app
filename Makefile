version=1.0.0
tag=m59peacemaker/node-babel

build:
	@docker build -t ${tag}:${version} .
