#!/bin/bash


case ${1} in
	app:start)
	pg_ctlcluster --foreground 11 main start
	;;
	app:initdb)
	pg_createcluster 11 main
	;;
	*)
	exec "$@"
esac

