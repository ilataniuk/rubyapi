#!/bin/bash
sleep 25
set -e
rails db:create && rails db:migrate
exec "$@"
