build_image:
	docker build --build-arg PHP_VERSION_ARG=5.6 -t dock4/php:5.6 -f ./php/Dockerfile .
	docker build --build-arg PHP_VERSION_ARG=7.2 -t dock4/php:7.2 -f ./php/Dockerfile .
	docker build --build-arg PHP_VERSION_ARG=7.4 -t dock4/php:7.4 -f ./php/Dockerfile .
	docker build --build-arg PHP_VERSION_ARG=8.0 -t dock4/php:8.0 -f ./php/Dockerfile .
	docker build --build-arg PHP_VERSION_ARG=8.1 -t dock4/php:8.1 -f ./php/Dockerfile .
