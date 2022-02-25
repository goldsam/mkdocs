#!/bin/sh

max_iterations=20
wait_seconds=0.5
http_endpoint="$PLANTUML_SERVER"

if [ "$1" = 'serve' ]; then
  dev_addr_set=false
  for item in "${@:2}"
  do
    if [ "$item" = '-a' ] || [ "$item" = '--dev-addr' ]; then
      dev_addr_set=true
    fi
  done

  if [ "$dev_addr_set" = 'false' ]; then
    set -- "$@" '-a' '0.0.0.0:8000'
  fi

fi

java -jar /app/plantuml.jar -Dplantuml.include.path=/docs -picoweb:8001 &

printf 'waiting for plauntuml server to be ready'

i=0
while true
do
  i=$((i+1))

	printf '.'
	
	http_code=$(curl -s -o /dev/null -L -w '%{http_code}' "$http_endpoint";)

	if [ "$http_code" -eq 200 ]; then
		printf 'plantuml server is ready.'
    break
	fi

	if [ "$i" -ge "$max_iterations" ]; then
		printf 'Error: plauntuml server did not respond in a timely manner.'
		exit 1
	fi

  sleep $wait_seconds
done

mkdocs "$@"
