#!/bin/bash

export GFSH=/Users/nnag/Downloads/pivotal-gemfire-9.6.0/bin

$GFSH/gfsh start locator --name=locator3_1 --port=10446 --http-service-port=1111 --properties-file=gemfire.properties

$GFSH/gfsh -e "connect --locator=localhost[10446]" -e "start server --name=server3_1 --server-port=10453"

$GFSH/gfsh -e "connect --locator=localhost[10446]" -e "start server --name=server3_2 --server-port=10454"

$GFSH/gfsh -e "connect --locator=localhost[10446]" -e "start server --name=server3_3 --server-port=10455"

$GFSH/gfsh -e "connect --locator=localhost[10446]" -e "create region --name=region --type=PARTITION"

$GFSH/gfsh -e "connect --locator=localhost[10446]" -e "create gateway-receiver"
