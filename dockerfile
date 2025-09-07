FROM python:3.10-slim-buster

WORKDIR /app
COPY . /app

# Install essential tools and AWS CLI
RUN pip install --no-cache-dir awscli && \
    pip install --no-cache-dir -r requirements.txt

CMD ["python3", "app.py"]
