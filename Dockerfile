FROM python:3.9-slim

RUN apt-get update && apt-get install -y git

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]