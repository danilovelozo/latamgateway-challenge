# Latam Gateway - Ruby on Rails Backend Challenge

## ZipCode API with Ruby on Rails

### Tools

- Ruby 3.2.2
- Rails 7.1.3.2
- PostgreSQL

### Local Setup

Run the following commands:

```
cd latamgateway-challenge
bundle install
rails db:setup
```

### Docker Setup

For Docker setup configuration, run the following commands:

```
docker build .
cd development/
docker-compose run web bundle install
docker-compose run web rails db:migrate
docker-compose run web rails db:setup
docker-compose build
docker-compose up

```

### API Documentation
- [Documentation](https://apidog.com/apidoc/shared-29455587-b98e-43e1-8564-234f5859008e)

### Production Endpoint
- https://latamgateway-challenge.onrender.com

### Tests
- Run the following command:

```
rspec
```