#!/usr/bin/env bash
function ram_ocupada {
	/usr/bin/vmstat -s | /usr/bin/grep "used memory" | /usr/bin/awk '{print $1}'
}
ram=$(ram_ocupada)

function carga_ult_min {
	/usr/bin/uptime | /usr/bin/awk '{print $9}'
}
carga_minuto=$(carga_ult_min)

function carga_cinco_min {
	/usr/bin/uptime | /usr/bin/awk '{print $10}'
}
carga_cinco=$(carga_cinco_min)

function carga_quince_min {
	/usr/bin/uptime | /usr/bin/awk '{print $11}'
}
carga_quince=$(carga_quince_min)

function espacio_disco {
	/usr/bin/df | /usr/bin/grep "/dev/sda1" | /usr/bin/awk '{print $4}'
}
disco=$(espacio_disco)

function contagiados_covid {
	/usr/bin/curl https://covid-api.mmediagroup.fr/v1/cases?country=Colombia | /usr/bin/jq |/usr/bin/awk 'NR==3 {print $2}'
}
covid=$(contagiados_covid)

/usr/bin/curl https://api.thingspeak.com/update?api_key=SLHXQMF919IGTDH9\&field1=${ram}\&field2=${carga_minuto}\&field3=${carga_cinco}\&field4=${carga_quince}\&field5=${disco}
