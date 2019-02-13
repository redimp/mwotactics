#!/bin/bash
set -e -x

cat <<EOF >/usr/src/app/secrets.txt
{
	"cookie": "CHANGEME",
	"mongodb_string": "mongodb://wottactics:wottactics@mongodb:27017/wottactics",
	"admin_password": "wottactics",
	"socket_io_servers": "",
	"static_host": "",
	"redis_options": {"host": "redis", "port": 6379, "pass":""},
	"port":80,
	"ga_id":"",
	"adsense_id": "",
	"upload_path":"http://forum.wottactic.com/upload/",
	
	"facebook": {
		"client_id": "", 
		"secret": ""
	},
	
	"google": {
		"client_id": "",
		"secret": ""
	},
	
	"twitter": {
		"client_id": "",
		"secret": ""
	},

	"steam" : {
		"api_key": ""
	},

	"battlenet" : {
		"client_id": "",
		"secret": ""
	},
	
	"wg_api_key": "",
	
	"vk": {
		"client_id": "",
		"secret": ""
	}
}
EOF

exec "$@"
