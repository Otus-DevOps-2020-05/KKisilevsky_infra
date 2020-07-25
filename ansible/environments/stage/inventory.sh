#!/bin/bash

cd ../terraform/stage > /dev/null
EXTERNAL_APP_IP=$(terraform output external_ip_address_app)
EXTERNAL_DB_IP=$(terraform output external_ip_address_db)
INTERNAL_DB_IP=$(terraform output internat_ip_address_db)
cd - > /dev/null
cat << _EOF_
{
    "_meta": {
        "hostvars": {
            "appserver": {
                "ansible_host": "$EXTERNAL_APP_IP",
                "db_host": "$INTERNAL_DB_IP",
                "env": "stage",
                "nginx_sites": {
                    "default": [
                        "listen 80",
                        "server_name \"reddit\"",
                        "location / { proxy_pass http://127.0.0.1:9292; }"
                    ]
                }
            },
            "dbserver": {
                "ansible_host": "$EXTERNAL_DB_IP",
                "env": "stage",
                "mongo_bind_ip": "0.0.0.0"
            }
        }
    },
    "all": {
        "children": [
            "app",
            "db",
            "ungrouped"
        ]
    },
    "app": {
        "hosts": [
            "appserver"
        ]
    },
    "db": {
        "hosts": [
            "dbserver"
        ]
    }
}
_EOF_
