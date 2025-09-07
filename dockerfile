FROM python:3.10-slim-buster

WORKDIR /app
COPY . /app

# Install dependencies for awscli and update package list
RUN apt-get update -y && \
    apt-get install -y \
        awscli \
        curl \
        unzip \
        less \
        groff \
        ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

CMD ["python3", "app.py"]
