# MySQL Docker Image

## How to use this image

### Add Your Seed SQL Data Files

This Docker MySQL image has `ONBUILD` commands to create and import your databases. Place your databases in the `assets/databases` folder. The basename of your SQL file will be used as the database name. 

For example, if you add the SQL dump `microservicedb.sql` to `./assets/databases/` a database named `microservicedb` with the content of `./assets/databases/microservicedb.sql` will be created when you build a new image.

### Create a `Dockerfile`

The `docker-compose.yml` file uses an alternate `Dockerfile`. When creating this `Dockerfile` name it `Dockerfile-alt`

	FROM jonbrouse/mysql
	CMD ["mysqld"]

### Build and Start Your Container

	docker-compose build
	docker-compose up -d
