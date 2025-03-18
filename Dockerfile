FROM python:3.11

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN chmod +x /app/run_locust_with_configuration.sh

ENTRYPOINT ["/app/run_locust_with_configuration.sh"]
