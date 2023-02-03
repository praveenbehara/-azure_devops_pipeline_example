# set base image (host OS)
FROM python:3.8.5-slim-buster

EXPOSE 5000
ARG AZURE_OPENAI_KEY
ENV AZURE_OPENAI_KEY=$AZURE_OPENAI_KEY

# set the working directory in the container
WORKDIR /code

# copy the dependencies file to the working directory
COPY requirements.txt .

# install dependencies
RUN pip install -r requirements.txt

# copy the content of the local src directory to the working directory
COPY src/ .

# command to run on container start
CMD [ "python", "./app.py" ]