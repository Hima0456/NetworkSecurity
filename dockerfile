FROM python:3.10-slim-buster

WORKDIR /app
COPY . /app

# Install essential tools and AWS CLI
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends curl unzip ca-certificates && \
    pip install --no-cache-dir awscli && \
    rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

CMD ["python3", "app.py"]
