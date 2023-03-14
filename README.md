# Users Retriever

This app retrieves users from [DummyJson](https://dummyjson.com/users) and save them to a database.

## Versions

- Ruby 3.1.1
- Rails 7.0
	
## Application setup

### Using Docker

### PostgreSQL

```shell
docker run --name postgres -p 5432:5432 -e POSTGRES_PASSWORD=mysecretpassword -d postgres
```

### Redis

```shell
docker run --name redis -d -p 6379:6379 -i -t redis
```
