# express-mysql-passport-jwt-api

Create a API server with mysql table crud without ORM and with passport local strategy

[![npm](https://img.shields.io/npm/l/vue-easytable.svg?maxAge=2592000)](http://www.opensource.org/licenses/mit-license.php)

## Installation and execution

```
git clone https://github.com/prashantnirgun/express-mysql-passport-jwt-api <folder>
cd <folder>
npm install
npm run dev
```

### Configuration

rename .env.sample file to .env and replace your database details inside it

This is not yet documented but I will fix it soon.

#### Login Endpoints

```
POST http://localhost:5000/api/login
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
```

#### GET all members

```
GET http://domain:5000/api/members
```

#### GET selected fields

```
GET http://domain:5000/api/members?fields=member_name,city_name
```

#### GET limit clause

```
GET http://domain:5000/api/members?limit=10
```

#### GET limit with offset clause

```
GET http://domain:5000/api/members?limit=10&offset=3
```

#### GET Sort by clause

```
GET http://domain:5000/api/members?sort_by=city_name

GET http://domain:5000/api/members?sort_by=city_name asc,member_name des

GET http://domain:5000/api/members?sort_by=city_name,member_name
```

#### GET total_rows clause

For pagination we display n rows per page but we need to find how many rows inside the table. It fires two queries.<br/>
01 is to determine how many rows inside talble select count(id) into total_rows from table<br/>
02 is used to return the result set select fields,... from table

```
GET http://domain:5000/api/members?limit=10&offset=3&total_rows=true
```

#### GET with all params

```
GET http://domain:5000/api/members?fields=<compa seprated table column list>&sort_by=city_name asc,member_name des&limit=10&offset=3

GET http://domain:5000/api/members?fields=<compa seprated table column list>&sort_by=city_name asc,member_name des&limit=10&offset=3&total_rows=true
```

#### GET selected member

```
GET http://domain:5000/api/member/4
```

#### Add new member

```
POST http://domain:5000/api/member/4
BODY { "fields":"value" }
HEADER { "Authorization" : "Bearer <COPY PASTE TOKEN RECEIVED AFTER LOGIN>"
}
```

#### Update member

```
PUT http://domain:5000/api/member/4
BODY { "fields":"value" }
HEADER { "Authorization" : "Bearer <COPY PASTE TOKEN RECEIVED AFTER LOGIN>"
}
```

#### Delete member

```
DELETE http://domain:5000/api/member/4
HEADER { "Authorization" : "Bearer <COPY PASTE TOKEN RECEIVED AFTER LOGIN>"
}
```

### Feature

- Handllebar View Engine added
- Schema Model to autogenerate CRUD Operation
- Swagger API Integration
- Enviroment Variables
- Passport JWT
- Soft Delete Turn off / On

### References

- links.txt file for example / insperation I dervied from referenses.
- /scripts/tables.sql for generating MySQL database, tables & sample records
