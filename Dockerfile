FROM python:3.9-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*

COPY . ./
RUN pip3 install -r requirements.txt --user

EXPOSE 8080

ENTRYPOINT ["streamlit", "run", "QnA_App_PaLM.py", "--server.port=8080", "--server.address=0.0.0.0"]
