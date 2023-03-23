all:
	@echo "Bundler 2.4.7 test..."
	@docker build --quiet --build-arg RUBYGEMS_VERSION=3.4.7 --tag ruby-bundler-2.4.7 . >/dev/null
	@docker run -it --rm --entrypoint /root/test.sh ruby-bundler-2.4.7
	@echo "--------------------------------------------------------------------------"
	@echo "Bundler 2.4.8 test..."
	@docker build --quiet --build-arg RUBYGEMS_VERSION=3.4.8 --tag ruby-bundler-2.4.8 . >/dev/null
	@docker run -it --rm --entrypoint /root/test.sh ruby-bundler-2.4.8
	@echo "--------------------------------------------------------------------------"
	@echo "Bundler 2.4.9 test..."
	@docker build --quiet --build-arg RUBYGEMS_VERSION=3.4.9 --tag ruby-bundler-2.4.9 . >/dev/null
	@docker run -it --rm --entrypoint /root/test.sh ruby-bundler-2.4.9
