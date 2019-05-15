#!/bin/sh

kubectl logs --selector='app=demo' --all-containers -f