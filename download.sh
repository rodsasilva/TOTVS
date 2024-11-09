#!/bin/bash

URL_LIST="\
https://bitbucket.org/felipe_raposo/docker-protheus-postgresql-microsoft-sql-server/downloads/tttm120_2310.rpo
--directory-prefix=./artifacts/apo/
https://bitbucket.org/felipe_raposo/docker-protheus-postgresql-microsoft-sql-server/downloads/systemload_2310.tar.xz
--directory-prefix=./artifacts/systemload/"

mkdir -p ./artifacts/apo/
mkdir -p ./artifacts/systemload/

echo "${URL_LIST}" | xargs -n 2 echo wget -q -N
echo "${URL_LIST}" | xargs -n 2 -P 4 wget -q -N

ERRCODE=$?
if [[ $ERRCODE -eq 0 ]]; then
	echo "Download complete"
else
	echo "Download failed **** error ${ERRCODE}"
fi
