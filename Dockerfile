FROM python:3.12.0a3-slim

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt && \
    apt-get update && \
    apt-get install -y curl

COPY . .

CMD [ "python3", "manage.py", "runserver", "0.0.0.0:8000"]
HEALTHCHECK CMD curl --fail http://localhost/ || exit 1