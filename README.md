# Users Retriever

This app retrieves users from [DummyJson](https://dummyjson.com/users) and save them to a database.

## Versions

- Ruby 3.1.1
- Rails 7.0
	
## Application setup

Using Docker for PostgreSQL and Redis and Running Rails locally

### PostgreSQL

```shell
docker run --name postgres -p 5432:5432 -e POSTGRES_PASSWORD=mysecretpassword -d postgres
```

### Redis

```shell
docker run --name redis -d -p 6379:6379 -i -t redis
```

### Create and migrate database

```shell
rails db:create && rails db:migrate
```

### Allowing Rails to cache on development

```shell
rails dev:cache
# => Development mode is now being cached.
```

## Fetching Users

There's a "Fetch Button" when there are no users in the database

<img width="1335" alt="Screenshot 2023-03-21 at 21 57 20" src="https://user-images.githubusercontent.com/8007754/226774606-4bf7a602-eb7c-45be-a5b0-ce52324df525.png">

## After fetching users


<img width="1341" alt="Screenshot 2023-03-21 at 21 58 36" src="https://user-images.githubusercontent.com/8007754/226774675-c7a15e8a-fdcf-4bae-bd3b-7fe709cdef37.png">

## Searching and filtering

Search by Name or Email

<img width="1352" alt="Screenshot 2023-03-21 at 22 00 58" src="https://user-images.githubusercontent.com/8007754/226775184-9f26e3c1-24b0-48b0-a819-ac63565aba93.png">

Combine with filters

<img width="1356" alt="Screenshot 2023-03-21 at 22 02 33" src="https://user-images.githubusercontent.com/8007754/226775225-a4aa8749-6299-4066-9608-b2f5b8dc6b74.png">


