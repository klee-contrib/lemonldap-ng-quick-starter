#!/bin/bash

container=lemonldapng-quickstarter-auth-1;

if [ "$#" -eq 1 ]; then
	docker exec -i $container slappasswd -s $1
else
	docker exec -i $container slappasswd
fi
