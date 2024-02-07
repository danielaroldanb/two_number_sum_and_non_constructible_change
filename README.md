# 'Two Number Sum' and 'Non-Constructible Change Challenges'

In this repository, you can find the solution to the technical challenges linked below. A web application was developed using Ruby on Rails, allowing you to visualize the results for both problems.

- [Two-Number-Sum](https://42i.notion.site/Two-Number-Sum-83fced39cc3b4bb698c365fffa7b9444)
- [Non-Constructible-Change](https://42i.notion.site/Non-Constructible-Change-e423c9af05c64621a40bf9dcefee3930)

## How to start:

## Local Execution

- Developed in Ruby on Rails 6.1.6
- Ruby version used in development: Ruby 2.7.4

1. Clone the Repository
2. Install Dependencies
``` ruby
bundle install
```
3. Database Setup (It is enough to run the migrations for this case)
``` ruby
rails db:migrate
```
4. Run the Application
``` ruby
rails s
```
5. Access the Application
``` ruby
localhost:3000
```

## Dockerized Execution (Recommended)

Requirements
- Docker
- Docker Compose

1. Build a container image:
``` ruby
docker-compose build
```

2. Run the application within a container:
``` ruby
docker-compose up
```
3. The application will be available at localhost:3000

## Linter / Checkstyle

The code style was reviewed using RuboCop, a gem that enforces consistent code formatting and helps identify potential issues. RuboCop analyzes the code based on predefined rules and provides feedback to ensure adherence to best practices and coding conventions.
To run RuboCop and check for style violations run:
``` ruby
rubocop
```

## Tests

Tests have been written to ensure the functionality of the code for both challenges. To run the tests:
``` ruby
rails test test/controllers/challenge_one_controller_test.rb
rails test test/controllers/challenge_two_controller_test.rb
```

## Web Interface for Running the Solution
To interact with the solution, a web interface has been developed.

Below are screenshots of the web interface, showcasing different sections and functionalities of the application:

- Home Page

![image](https://github.com/danielaroldanb/Exponential-function-approximation/assets/89650193/85185612-274b-4e57-8126-d6b10d6578a5)

- Two Number Sum Challenge:

![image](https://github.com/danielaroldanb/Exponential-function-approximation/assets/89650193/462bc4e2-43ed-4417-b040-ab86c566c862)

- Non-Constructible Change Challenge:

![image](https://github.com/danielaroldanb/Exponential-function-approximation/assets/89650193/6fd8016c-d993-4932-843c-4d6c28b30eeb)
