# our base image
FROM python:3.12-rc-slim-buster

# Install python and pip
# RUN apk add --update py2-pip

# upgrade pip
RUN python -m pip install --upgrade pip

# install Python modules needed by the Python app
COPY requirements.txt .
RUN pip install -r requirements.txt

# copy files required for the app to run
COPY main.py .
COPY templates/ ./
COPY templates/home.html templates/home.html
COPY templates/home.css templates/home.css

# tell the port number the container should expose
EXPOSE 5000

# run the application
CMD ["python", "main.py"]