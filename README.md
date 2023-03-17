# Marketplace API Project - Traidr

## Table of Contents

- [About](#about)
- [Usage](#usage)
- [Getting Started](#getting_started)
- [Test the API (Locally)](#test_the_API)
- [Run the Mini Tests](#run_the_mini_tests)
- [API Specificiations Docs](./docs/api_specifications.md)

## About <a name = "about"></a>

Traidr is a marketplace API that allows users to seamlessly buy and sell products. Users can basically create their own store upload products to sell or place orders on the platform.

## Usage <a name = "usage"></a>

- Test the API thorough this Swagger Interactive Docs - [here](#here)
- You can also find the API Specifications Docs [here](./docs/api_specifications.md)

## Getting Started <a name = "getting_started"></a>

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

```
ruby
rails
postgres
```

### Setting up a development environment

#### Step 1: Clone the repository

```
git clone https://github.com/benessilfie/traidr.git
```

or with Github CLI

```
gh repo clone benessilfie/traidr
```

#### Step 2: Run Bundle install

```
bundle install
```

#### Step 3: start the server

```
rails start
```

## Test the API (Locally) <a name = "test_the_API"></a>

- You can either go to the interactive swagger documentation locally at `http://api.lvh.me:3000/v1/docs` or the deployed version at `insert deployed version here`

- Alternatively you can also use the API testing tool of your choice. You'll find the API documentation with the base URL and various endpoints [here](./docs/api_specifications.md)

### Example

#### Creating a user account

- curl

```bash
curl --request POST \
  --url http://api.lvh.me:3000/v1/users \
  --header 'Content-Type: application/json' \
  --data '{
    "user": {
      "email": "test@example.com",
      "password": "password"
    }
  }'
```

- httpie

```
http api.lvh.me:3000/v1/users \
user:='{"email":"test@example.com","password":"password"}'
```

- postman
  - URL - http://api.lvh.me:3000/v1/api/users
  - Method - POST

```bash
{
    "user": {
        "email": "test@example.com",
        "password": "password"
    }
}
```

#### Response

```bash
{
    "data": {
        "id": "1",
        "type": "user",
        "attributes": {
            "email": "test@example.com"
        },
        "relationships": {
            "products": {
                "data": []
            }
        }
    }
}
```

## Run the Mini Tests <a name = "run_the_mini_tests"></a>

To run the tests, just run the `rails test` command

```bash
rails test
```

## Author

[Benjamin Essilfie Quansah](https://www.linkedin.com/in/benessilfie/)
