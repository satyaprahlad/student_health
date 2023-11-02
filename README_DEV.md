# Student_Health. 
## Dont commit to main branch directly
An example of Django project with basic user functionality.



## Installing

Install the git if you dont have   

to install the git use the command in ubuntu

 sudo apt install git

### Clone the project

```
To clone the project you need to do following steps 

1. Go to the git portal in Account Settings >> Developer Settings >> personal tocken and create a tocken

2. copy the tocken id

3.now clone the project using this syntax

example: 
git clone https://YOUR_TOCKEN@github.com/username/repo.git



```

```
##To save the credentials of the git use this command

git config --global credential.helper --store


```

```

### Install mysql follow the steps

1. sudo apt update

2. sudo apt install mysql-server

3. sudo systemctl status mysql.service

### Create a database and create the password for the user

1. create database <database_name>;

2. create user <'username'>@'localhost' identified by <'password'>;


### create the virtual enviroment in the directory of the manage.py

1. python -m venv venv or python3 -m venv venv

2. source venv/bin/activate

3. pip install requirements.txt

### if mysql has not found use the syntax for following:

1. pip install mysqlclient

2. pip install PyMySQL

3. pip install mysqlclient

4. sudo apt install libmysqlclient-dev in terminal


### Now run the application with following syntax

1. pip install requirements.txt

2. python manage.py migrate

3. python manage.py makemigration

4. python manage.py runserver





###Docker setup and install run and push the docker image

##To install the docke follow the syntax

1. sudo apt-get remove docker docker-engine docker.io (To remove the old docker engines for safety)

2. sudo apt-get update

3. sudo apt-get install docker-ce (or) sudo apt install docker.io

4. sudo snap install docker


### To see the images install the docker follow the steps

1. sudo docker images (images)

2. sudo docker ps -a (containers)

3. sudo docker ps


### To install the docker desktop

1. Download the deb package from the docker

2. go to download directory

3. sudo apt-get update

4. sudo apt-get install ./docker-desktop-<version>-<arch>.deb

5. systemctl --user start docker-desktop

### To build and clone the git in the docker and pull images


Dockerfile-------------->-------Image---------->----container
              build                       run

to build the docker image use the syntax
sudo docker-compose build


to run the docker image use the following syntax
sudo docker-compose up


to pull the docker image use the following syntax
docker pull registry/repository:tag

to push the docker image use the follwing syntax
docker push registry/repository:tag




docker build -t registry/repository:tag .
docker build -t registry/repository:tag -f Dockerfile path .
docker build -t goutham:tag .
docker build -t goutham .

docker tag goutham:latest registry/repository:tag

docker run -it/dit registry/repository:tag bash
 

docker images



create the docker file and add the following syntax

# syntax=docker/dockerfile:1
FROM python:3.10.12
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
WORKDIR /code
COPY requirements.txt /code/
RUN pip install -r requirements.txt
COPY . /code/



create docker-compose.yml file

services:
  db:
    image: postgres:latest
    volumes:
      - ./data/db:/var/lib/postgresql/data
    environment:
      - POSTGRES_DB=lead_mgmt
      - POSTGRES_USER=postgres
      - POSTGRES_PASSWORD=root
  web:
    build: .
    command: python manage.py runserver 0.0.0.0:8000
    volumes:
      - .:/code
    ports:
      - "8000:8000"
    environment:
      - POSTGRES_NAME=lead_mgmt
      - POSTGRES_USER=postgres
      - POSTGRES_PASSWORD=root
    depends_on:
      - db



In settings.py change the database

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': os.environ.get('POSTGRES_NAME'),
        'USER': os.environ.get('POSTGRES_USER'),
        'PASSWORD': os.environ.get('POSTGRES_PASSWORD'),
        'HOST': 'db',
        'PORT': 5432,
    }
}




