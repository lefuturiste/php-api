.SILENT:
.PHONY: server serve help test dev
PORT?=8000
HOST?=127.0.0.1

serve: server
dev: server
server:
	php -S $(HOST):$(PORT) -t public -d display_errors=1
test:
	php ./vendor/bin/phpunit --stop-on-failure
