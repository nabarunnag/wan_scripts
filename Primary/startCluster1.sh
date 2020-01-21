#!/bin/bash

export GFSH=/Users/nnag/Downloads/pivotal-gemfire-9.6.0/bin

$GFSH/gfsh start locator --name=locator1_1 --port=10444 --properties-file=gemfire.properties

$GFSH/gfsh -e "connect --locator=localhost[10444]" -e "start server --name=server1_1 --server-port=10447"

$GFSH/gfsh -e "connect --locator=localhost[10444]" -e "start server --name=server1_2 --server-port=10448"

$GFSH/gfsh -e "connect --locator=localhost[10444]" -e "start server --name=server1_3 --server-port=10449"

$GFSH/gfsh -e "connect --locator=localhost[10444]" -e "create gateway-sender --id=sender1 --remote-distributed-system-id=2 --parallel=false"

$GFSH/gfsh -e "connect --locator=localhost[10444]" -e "create region --name=region --type=PARTITION --gateway-sender-id=sender1"

$GFSH/gfsh -e "connect --locator=localhost[10444]" -e "create gateway-receiver"
