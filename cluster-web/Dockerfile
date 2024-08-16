# FROM python:3.9
FROM bizkut/cluster-web-python:latest

#RUN apt-get update && apt-get install -y libev-dev libevdev2

#RUN pip3 install bjoern

WORKDIR /app

COPY . ./

#RUN pip install -r requirements.txt

# COPY entrypoint.sh file
COPY entrypoint.sh /entrypoint.sh
    
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]

# RUN cat /app/cfg/config.json
# CMD ["python3","wsgi.py"]
