FROM python:3.9

RUN apt-get update && apt-get install -y libev-dev libevdev2

RUN pip3 install bjoern

WORKDIR /app

COPY . ./

RUN pip install -r requirements.txt

EXPOSE 8080
CMD [ "python", "wsgi.py" ]
