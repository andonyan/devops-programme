FROM ubuntu:22.04

COPY requirements.txt requirements.txt

RUN  apt-get update && \
     apt-get install python3 python3-pip -y --no-install-recommends && \
     pip install -r requirements.txt && \
     useradd -ms /bin/bash web_user

COPY --chown=web_user /app /app/

USER web_user

ENTRYPOINT [ "python3" ]
CMD  ["/app/app.py"]