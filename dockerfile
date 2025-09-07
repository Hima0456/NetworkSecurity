FROM python:3.10-slim-buster

WORKDIR /app
COPY . /app

# Install dependencies needed for awscli
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
        curl \
        unzip \
        less \
        groff \
        ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Install AWS CLI via pip
RUN pip install --no-cache-dir awscli


# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

CMD ["python3", "app.py"]
