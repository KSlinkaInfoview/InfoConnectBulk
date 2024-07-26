#!/bin/bash
java -jar -Djasypt.encryptor.password=password -Dpython.home=./lib/jython-standalone-2.7.1.jar lib/info_connect_rpa_hub-2.0.2.jar &
sleep 30
java -cp lib/as400-control.jar  com.infoviewsystems.as400.control.As400ControlApplication


PID_HUB=$(lsof -P -i | grep "localhost:8082" | awk '{print $2}')
echo "Killing the process with PID $PID_HUB"
kill -9 "$PID_HUB"

echo "Clean up recourcess"
rm -r src
