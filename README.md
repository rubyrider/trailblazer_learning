# README
The purpose of this project is to learn trailblazer.

### CI Integration
[![CircleCI](https://circleci.com/gh/rubyrider/trailblazer_learning.svg?style=svg)](https://circleci.com/gh/rubyrider/trailblazer_learning)

### Installation
* `Bundle install`
* `rake db:setup`
* `rake` # run test cases
* `rails s`


### Documentation:
* To create user:
```
POST /users

Params:
email - A valid and unique email address. Required field.
full_name - A full name of the user.

resp = post("/users", "email" => "irfandhk@gmail.com", "full_name" => "Irfan Ahmed")

resp.status
=> 200

resp.body
=> { id: 1, email: 'irfandhk@gmail.com', full_name: 'Irfan Ahmed', token: 'dcbb7b36acd4438d07abafb8e28605a4' }

resp = conn.post("/users", email: 'irfandhk@gmail.com')

resp.status
=> 422

resp.body
=> { "errors": { "email": [ "has already been taken" ] } }
```
* To get current user info:
```
GET /user

resp = get("/user", header: {"HTTP_AUTHORIZATION" => "Token dcbb7b36acd4438d07abafb8e28605a4"})

resp.status
=> 200

resp.body
=> { id: 1, email: 'irfandhk@gmail.com', full_name: 'Irfan Ahmed', token: 'dcbb7b36acd4438d07abafb8e28605a4' }

resp = conn.get("/user")

resp.status
=> 401

resp.body
=> { "errors": 'Access denied' }
```

* Update current user
  
```
PUT /user

Params:
email - A valid and unique email address. Required field.
full_name - A full name of the user.

resp = put("/user", params: { email: 'rubyridergo@gmail.com' },
header: { "HTTP_AUTHORIZATION" => "Token dcbb7b36acd4438d07abafb8e28605a4" })

resp.status
=> 200

resp.body
=> { id: 1, email: 'rubyridergo@gmail.com', full_name: 'Irfan Ahmed', token: 'dcbb7b36acd4438d07abafb8e28605a4' }

resp = conn.post("/user", email: 'rubyridergo@gmail.com' ),
header: { "HTTP_AUTHORIZATION" => "Token dcbb7b36acd4438d07abafb8e28605a4" })

resp.status
=> 204

resp.body
=> { "errors": { "email": [ "has already been taken" ] } }
```

To view on yard doc:
`gem install yard`

Rub `yard server` in the project directory 
