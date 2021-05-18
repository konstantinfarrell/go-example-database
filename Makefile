PG_HOST ?= localhost
PG_NAME ?= filestore
PG_USER ?= postgres
PG_PASS ?=
SCRIPTS = ./scripts

init:
	for file in $(SCRIPTS)/init/* ; do \
		if test "$(PG_HOST)" = "localhost"; then \
			PGPASSWORD=$(PG_PASS) psql -U $(PG_USER) -a -f $${file} ; \
		else \
			PGPASSWORD=$(PG_PASS) psql -U $(PG_USER) -h $(PG_HOST) -a -f $${file} ; \
		fi; \
	done	

schema:
	for file in $(SCRIPTS)/schema/* ; do \
		if test "$(PG_HOST)" = "localhost"; then \
			PGPASSWORD=$(PG_PASS) psql -U $(PG_USER) -d $(PG_NAME) -a -f $${file} ; \
		else \
			PGPASSWORD=$(PG_PASS) psql -U $(PG_USER) -h $(PG_HOST) -d $(PG_NAME) -a -f $${file} ; \
		fi; \
	done	

reset:
	for file in $(SCRIPTS)/reset/* ; do \
		if test "$(PG_HOST)" = "localhost"; then \
			PGPASSWORD=$(PG_PASS) psql -U $(PG_USER) -a -f $${file} ; \
		else \
			PGPASSWORD=$(PG_PASS) psql -U $(PG_USER) -h $(PG_HOST) -a -f $${file} ; \
		fi; \
	done	