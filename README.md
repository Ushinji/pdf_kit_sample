# What is this ?
This is sample application that it serves a pdf download using pdfkit and wkhtmltopdf.

# Tech stack
* Ruby
    * 2.6.3
* Rails
    * 6.0.0
* MySQL
    * 5.7
* Docker

# Need
* Docker, docker-compose

# Setup
* Run a bootstrap script

```
$ sh ./scripts/development/bootstrap.sh
$ docker-compose ps

         Name                      Command               State                 Ports              
-------------------------------------------------------------------------------------------------
pdf_kit_sample_app_1   bundle exec rails s -p 300 ...   Up      0.0.0.0:3000->3000/tcp           
pdf_kit_sample_db_1    docker-entrypoint.sh mysqld      Up      0.0.0.0:3316->3306/tcp, 33060/tcp
```

# Run Lint

```
$ docker-compose run --rm app bundle exec rubocop -a
```
