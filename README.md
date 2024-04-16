# Latam Gateway - Ruby on Rails Backend Challenge

## ZipCode API with Ruby on Rails

### Tools

- Ruby 3.2.2
- Rails 7.1.3.2
- PostgreSQL 14
- Redis

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
- TODO

### Production Endpoint
- TODO

### Tests
- Run the following command:

```
rspec
```

### Code Review Shortcut
- TODO
