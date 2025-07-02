#use pyhton 3.12.4 as base image
FROM python:3.12.4

#set working directory
WORKDIR /app

COPY . /app

#copy requirements and install dependencies
RUN pip install --upgrade pip \
    && pip install -r requirements.txt

#Expose the application port
EXPOSE 8000
EXPOSE 8501


RUN apt-get update && apt-get install -y supervisor

#command to start FastAPI application
CMD ["/usr/bin/supervisord", "-c", "/app/supervisord.conf"]
