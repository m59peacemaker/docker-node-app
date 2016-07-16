v=1.0
tag=pmkr/node-app

tagv=${tag}:${v}
tagl=${tag}:latest

build:
	@docker build -t ${tagv} -t ${tagl} ./

publish: build
	@git add --a :/;             \
  git commit -am '${v}';       \
  git tag -a ${v} -m '${v}' && \
  git push --follow-tags    && \
  docker push ${tagv}       && \
  docker push ${tagl}
