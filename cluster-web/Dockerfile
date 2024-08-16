FROM bizkut/cluster-web-python:latest

WORKDIR /app

COPY . ./

COPY entrypoint.sh /entrypoint.sh
    
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
