# pug_bomb
API to destroy your friends' inboxes with pictures of pugs.

#examples

```
curl -X POST "http://localhost:3000/v1/pug_bombs" -d "email=owensims1@gmail.com"

{"message":"success"}
```

```
curl -X POST "http://localhost:3000/v1/pug_bombs" -d "email="

{"errors":["email must be present"]}
```
