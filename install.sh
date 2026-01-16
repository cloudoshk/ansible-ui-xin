#!/bin/bash
echo "Loading Docker image..."
docker load -i ansible-ui-image.tar
echo "Starting service..."
docker compose up -d
echo "Deployment successful! Access at http://localhost:5000"
