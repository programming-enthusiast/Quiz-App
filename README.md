# Quiz

## Overview
Tech stack
- Rails
- PostgreSQL
- AngularJS, Bootstrap
- RSpec, Capybara
## Features
- Users can sign up as a student or a teacher. 
- Teachers can create quizzes and answers.
- Students can take quizzes and see their scores.
- Teachers can view all the student's scores.

## Docker
Start containers
```
docker-compose up
```

Setup database
```
docker-compose run web bundle exec rake db:setup
```

## Test
```
bundle exec rake
```
