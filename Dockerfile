FROM ubuntu:22.04
COPY requirements.txt requirements.txt
RUN  apt-get update && \
     apt-get install python3 python3-pip -y && \
     pip install -r requirements.txt && \
     useradd -ms /bin/bash web_user
COPY /app /app
USER web_user
CMD  python3 /app/app.py

