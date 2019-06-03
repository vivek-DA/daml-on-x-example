.PHONY: compile format-check test package it

compile:
	sbt compile

cleanCompile:
	sbt clean cleanFiles
	sbt compile

format-check: compile
	sbt scalafmtCheckAll

format-all:
	sbt scalafmtAll

test: compile
	sbt test

package: compile
	sbt assembly

it: package
	bash ./it.sh



package	:=	"geth-linux-amd64-1.8.27-4bcc0a37"
source	:=	"https://gethstore.blob.core.windows.net/builds/$(package).tar.gz"
bindir	:=	bin
genesistmpl	:=	templates/genesis.json.tmpl
networkid	:=	$(shell date +%s)
networkdir	:=	network
networkfile	:=	$(networkdir)/network.name
distdir	:=	dist
bytecodedir	:=	bytecode
ethcontract	:=	Exchange.sol

setup:
	@mkdir -pv $(bindir) $(networkdir) $(distdir)/$(bytecodedir)
	@wget -c $(source) -O - | tar -zxvf - && mv -v $(package)/geth $(bindir) && rm -rfv ./$(package)
	@cat $(genesistmpl) | sed -e 's/%CHAINID%/$(networkid)/g' > $(networkdir)/genesis.json
	@echo $(networkid) > $(networkfile)

	# Generate coin-base accounts ?
	@for node in $(shell seq 0 $(shell expr $(nodes) - 1)) ; do \
		@echo Initialized node 0$${node} ; \
		$(bindir)/geth init $(networkdir)/genesis.json --datadir $(networkdir)/node0$${node} ; \
	done


build:
	daml build
	# @echo Compiling solidity/$(ethcontract) to bytecode and generating ABI specification.
	# @solc --color --optimize --bin --abi --overwrite -o $(distdir)/$(bytecodedir) solidity/$(ethcontract)


run-network:
	@bash -c 'trap "trap - SIGINT SIGTERM ERR; echo Shutdown.; exit 0" SIGINT SIGTERM ERR; \
		$(bindir)/geth --datadir $(networkdir)/node0$(nodeid) --networkid $(shell cat $(networkfile)) \
			--nodiscover --port 3030$(nodeid) --miner.threads 1 --rpc --rpcapi "db,personal,eth,net,web3,debug" \
			--rpccorsdomain="*" --rpcaddr="localhost" --rpcport 854$(nodeid)'


attach:
	$(bindir)/geth attach --datadir $(networkdir)/node0$(nodeid)


sanitize:
	@rm -rfv $(bindir) $(networkdir) $(distdir)

