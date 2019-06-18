# express-mysql-api
Create a API server with mysql table crud without ORM

## Installation and execution
```
git clone https://github.com/prashantnirgun/express-mysql-passport-jwt-api <folder>
cd <folder>
npm install
npm run dev
```
This is not yet documented but I will fix it soon.
### Login Endpoints
```
POST 'http://localhost:5000/api/login'
BODY : {
  "username" : "testUser",
  "password" : "abcd1234"
}
RESPONSE : {
"user": {
"id": 4,
"name": "Test",
"email_id": "test@gmail.com",
"mobile": "1234567890",
"user_group_id": 2,
"user_status_id": 37
},
"token": "eyJhbGciOiJIUzI1NiIsInR5cCI6"
}

### GET all members
GET http://domain:5000/api/members

### GET selected fields
GET http://domain:5000/api/members?fields=member_name,city_name

### GET limit
GET http://domain:5000/api/members?limit=10

### GET limit with offset
GET http://domain:5000/api/members?limit=10&offset=3

### GET with all params
GET http://domain:5000/api/members?fields=<compa seprated table column list>&limit=10&offset=3

### GET selected member
GET http://domain:5000/api/member/4

### Add new member
POST http://domain:5000/api/member/4
BODY { "fields":"value" }
HEADER { "Authorization" : "Bearer <COPY PASTE TOKEN RECEIVED AFTER LOGIN>"
}

### Update member
PUT http://domain:5000/api/member/4
BODY { "fields":"value" }
HEADER { "Authorization" : "Bearer <COPY PASTE TOKEN RECEIVED AFTER LOGIN>"
}

### Delete member
DELETE http://domain:5000/api/member/4
HEADER { "Authorization" : "Bearer <COPY PASTE TOKEN RECEIVED AFTER LOGIN>"
}
```
