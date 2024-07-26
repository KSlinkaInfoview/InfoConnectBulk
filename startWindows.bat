start java -jar -Djasypt.encryptor.password=password -Dpython.home=./lib/jython-standalone-2.7.1.jar lib/info_connect_rpa_hub-2.0.2.jar
timeout 20
java -cp lib/as400-control.jar com.infoviewsystems.as400.control.As400ControlApplication

timeout 1

for /f "tokens=5" %%a in ('netstat -ano ^| findstr "8082"') do set PID=%%a
taskkill /F /PID %PID%

rd /s /q src

pause
