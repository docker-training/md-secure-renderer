VERSION := "0.2"

test: build
	@docker build -t md-secure-renderer-test --build-arg KEY=test123 example/.
	@docker run -d -P -e KEY=test123 md-secure-renderer-test

build:
	@docker build -t broyal/md-secure-renderer:latest app/.

release: build
	@docker tag broyal/md-secure-renderer:latest broyal/md-secure-renderer:$(VERSION)
	@docker push broyal/md-secure-renderer:latest
	@docker push broyal/md-secure-renderer:$(VERSION)
