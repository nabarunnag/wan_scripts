#!/bin/bash

export GFSH=/Users/nnag/Downloads/pivotal-gemfire-9.6.0/bin
#export GFSH=/Users/nnag/Downloads/pivotal-gemfire-9.8.4/bin

$GFSH/gfsh start locator --name=locator2_1 --port=10445 --properties-file=gemfire.properties

$GFSH/gfsh -e "connect --locator=localhost[10445]" -e "start server --name=server2_1 --server-port=10450"

$GFSH/gfsh -e "connect --locator=localhost[10445]" -e "start server --name=server2_2 --server-port=104551"

$GFSH/gfsh -e "connect --locator=localhost[10445]" -e "start server --name=server2_3 --server-port=10452"

$GFSH/gfsh -e "connect --locator=localhost[10445]" -e "create gateway-sender --id=sender2_3 --remote-distributed-system-id=3 --parallel=false"

$GFSH/gfsh -e "connect --locator=localhost[10445]" -e "create gateway-sender --id=sender2_1 --remote-distributed-system-id=1 --parallel=false"

$GFSH/gfsh -e "connect --locator=localhost[10445]" -e "create region --name=region --type=PARTITION --gateway-sender-id=sender2_3,sender2_1"

$GFSH/gfsh -e "connect --locator=localhost[10445]" -e "create gateway-receiver" 

