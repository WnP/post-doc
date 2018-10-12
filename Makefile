POSTGRES=9.6
REPMGR=4.0
BARMAN=2.4
PGPOOL=3.7
ORUS=registry.orus.io

.DEFAULT_GOAL := default

build:
	echo "    \033[0;32mINFO:\033[0m Building docker images" \
	# ----------------------------------------
	# ----------------------------------------
	docker build -t $(ORUS)/postgres-$(POSTGRES)-repmgr-$(REPMGR) -f ../PostDock/src/Postgres-$(POSTGRES)-Repmgr-$(REPMGR).Dockerfile ../PostDock/src
	docker build -t $(ORUS)/barman-$(BARMAN)-postgres-$(POSTGRES) -f ../PostDock/src/Barman-$(BARMAN)-Postgres-$(POSTGRES).Dockerfile ../PostDock/src
	docker build -t $(ORUS)/pgpool-$(PGPOOL)-postgres-$(POSTGRES) -f ../PostDock/src/Pgpool-$(PGPOOL)-Postgres-$(POSTGRES).Dockerfile ../PostDock/src

push:
	echo "    \033[0;32mINFO:\033[0m Pushing docker images" \
	# ----------------------------------------
	# ----------------------------------------
	docker push $(ORUS)/postgres-$(POSTGRES)-repmgr-$(REPMGR)
	docker push $(ORUS)/barman-$(BARMAN)-postgres-$(POSTGRES)
	docker push $(ORUS)/pgpool-$(PGPOOL)-postgres-$(POSTGRES)

default: build push
	echo "    \033[0;32mAll done successfully\033[0m" \
	# ----------------------------------------
	# ----------------------------------------
