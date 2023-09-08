# Institute Manangement. 
## Dont commit to main branch directly
An example of Django project with basic user functionality.



## Installing

### Clone the project


```

### Install dependencies & activate virtualenv

```bash
pip install pipenv

pipenv install
pipenv shell
```

### Configure the settings (connection to the database, connection to an SMTP server, and other options)

1. Edit `source/app/settings.py` if you want

### Apply migrations if you dint not restore from backup

```bash
python source/manage.py migrate
```

### Collect static files (only on a production server)

```bash
python source/manage.py collectstatic
```

### Running

#### A development server

Just run this command:

```bash
python source/manage.py runserver


mysql> create database student_health;
CREATE USER 'student_health'@'localhost' IDENTIFIED BY 'password';
    -> ;
Query OK, 0 rows affected (0.04 sec)



mysql> GRANT ALL PRIVILEGES ON *.* TO 'student_health'@'localhost' WITH GRANT OPTION;
Query OK, 0 rows affected (0.01 sec)

```




#### 
restore backup loated source/student_health_backup.sql


admin1@gamil.com
india12345
