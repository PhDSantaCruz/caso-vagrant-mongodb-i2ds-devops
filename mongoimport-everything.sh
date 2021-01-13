#!/usr/bin/env bash
exit_code=0
mongo "${1}" --quiet --eval "db.dropDatabase()"
exit_code=$((exit_code + $?))

for file in /home/vagrant/*.csv;
do
	mongoimport --uri "${1}" --collection daily --type csv --headerline --file "${file}" &
	exit_code=$((exit_code + $?))
done
wait


echo "$0 finished with code $exit_code."
exit $exit_code
