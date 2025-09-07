FROM python:3.10-slim-buster

WORKDIR /app
COPY . /app

# Install dependencies needed for awscli
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
        awscli \
        curl \
        unzip \
        less \
        groff \
        ca-certificates \
        python3-pip \
        python3-setuptools \
        python3-distutils && \
    rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

CMD ["python3", "app.py"]
