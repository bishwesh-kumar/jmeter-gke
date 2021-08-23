#!/usr/bin/env bash

working_dir=`pwd`

#Get namesapce variable
tenant=`awk '{print $NF}' $working_dir/tenant_export`


## Make load test script in Jmeter master pod executable

#Get Master pod details

master_pod=`kubectl get po -n $tenant | grep jmeter-master | awk '{print $1}'`

kubectl exec -ti -n $tenant $master_pod -- cp -r /load_test /jmeter/load_test

kubectl exec -ti -n $tenant $master_pod -- chmod 755 /jmeter/load_test

