#!/bin/bash

curl -H "Content-Type: application/json" -X POST -d '{"type":"onOff","target":"Lumière N01","action":"state"}' http://localhost:3000/cmd
