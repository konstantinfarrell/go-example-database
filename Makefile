
POSTGRES_USER = postgres
PROJECT_USER = goexampleapiuser
PROJECT_DATABASE = filestore
SCRIPTS = ./scripts

init:
	for file in $(SCRIPTS)/init/* ; do \
		psql -U $(POSTGRES_USER) -a -f $${file} ; \
	done	

schema:
	for file in $(SCRIPTS)/schema/* ; do \
		psql -U $(POSTGRES_USER) -d $(PROJECT_DATABASE) -a -q -f $${file} ; \
	done	

reset:
	for file in $(SCRIPTS)/reset/* ; do \
		psql -U $(POSTGRES_USER) -a -f $${file} ; \
	done	