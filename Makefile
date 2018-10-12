POSTGRES=9.6
REPMGR=4.0
BARMAN=2.4
PGPOOL=3.7
REG=registry.orus.io
SRC=../PostDock/src

.DEFAULT_GOAL := default

build:
	echo "    \033[0;32mINFO:\033[0m Building docker images" \
	# ----------------------------------------
	# ----------------------------------------
	docker build -t $(REG)/postgres-$(POSTGRES)-repmgr-$(REPMGR) \
		-f $(SRC)/Postgres-$(POSTGRES)-Repmgr-$(REPMGR).Dockerfile $(SRC)
	#
	docker build -t $(REG)/barman-$(BARMAN)-postgres-$(POSTGRES) \
		-f $(SRC)/Barman-$(BARMAN)-Postgres-$(POSTGRES).Dockerfile $(SRC)
	#
	docker build -t $(REG)/pgpool-$(PGPOOL)-postgres-$(POSTGRES) \
		-f $(SRC)/Pgpool-$(PGPOOL)-Postgres-$(POSTGRES).Dockerfile $(SRC)

push:
	echo "    \033[0;32mINFO:\033[0m Pushing docker images" \
	# ----------------------------------------
	# ----------------------------------------
	docker push $(REG)/postgres-$(POSTGRES)-repmgr-$(REPMGR)
	docker push $(REG)/barman-$(BARMAN)-postgres-$(POSTGRES)
	docker push $(REG)/pgpool-$(PGPOOL)-postgres-$(POSTGRES)

default: build push
	echo "    \033[0;32mAll done successfully\033[0m" \
	# ----------------------------------------
	# ----------------------------------------
