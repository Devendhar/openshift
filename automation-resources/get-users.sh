#!/bin/bash

filter='?(.name=="htpasswd_provider")'

secret_name=$(oc get oauth cluster -o jsonpath="{ .spec.identityProviders[$filter].htpasswd.fileData.name }")

#echo $secret_name

secret_file=$(oc extract secret/$secret_name -n openshift-config --confirm)

#echo $secret_file

#cat $secret_file

cut -d : -f 1 $secret_file

rm $secret_file
