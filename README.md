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
  "username" : "amol",
  "password" : "abcd1234"
}
RESPONSE : {
"user": {
"id": 4,
"name": "amol",
"email_id": "amol@gmail.com",
"mobile": "9223588456",
"user_group_id": 2,
"user_status_id": 37
},
"token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwibmFtZSI6ImFtb2wiLCJlbWFpbF9pZCI6ImFtb2xAZ21haWwuY29tIiwibW9iaWxlIjoiOTIyMzU4ODQ1NiIsInVzZXJfZ3JvdXBfaWQiOjIsInVzZXJfc3RhdHVzX2lkIjozNywiaWF0IjoxNTYwODMzMjQ1LCJleHAiOjE1NjE0MzgwNDV9.scdk9Lmfv--je2J5RnZ_xAn9kXwIi8OGMvbtv5n_blY"
}
```
### GET all members
GET *http://domain:5000/api/members*
```
### GET selected fields
```
GET http://domain:5000/api/members?fields=member_name,city_name,reference_no,member_status,retirement_date]
```
### GET limit
```
GET http://domain:5000/api/members?limit=10
```
### GET limit with offset
```
GET http://domain:5000/api/members?limit=10&offset=3
```
### GET with all params
```
GET http://domain:5000/api/members?fields=<compa seprated table column list>&limit=10&offset=3
```
### GET selected member
```
GET http://domain:5000/api/members/4
```
### Add new member
```
POST http://domain:5000/api/members/4
BODY { "fields":"value" }
HEADER { "Authorization" : "Bearer <COPY PASTE TOKEN RECEIVED AFTER LOGIN>"
}
```
### Update member
```
PUT http://domain:5000/api/members/4
BODY { "fields":"value" }
HEADER { "Authorization" : "Bearer <COPY PASTE TOKEN RECEIVED AFTER LOGIN>"
}
```
### Delete member
```
DELETE http://domain:5000/api/members/4
HEADER { "Authorization" : "Bearer <COPY PASTE TOKEN RECEIVED AFTER LOGIN>"
}
```
