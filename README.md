# README

Heroku app: https://volt-test-demo.herokuapp.com/api/v1/posts   

Аутентификаци сделана по этому мануалу: https://www.pluralsight.com/guides/token-based-authentication-with-ruby-on-rails-5-api   

Регистрация

POST /register params: nickname, email, password - регистрация нового пользователя. В ответе придёт auth_token. 
Для последующих запросов его нужно передавать в headers: Authorization auth_token   

Авторизация   

POST /authenticate params: email, password. В ответе придёт auth_token. 

##Эндпоинты   

GET /api/v1/posts.json - список постов   
GET /api/v1/posts/1.json - вывод одного поста по ID   
GET /api/v1/posts/1/comments.json - вывод комментариев к посту

POST /api/v1/posts.json - добавление записи   
POST /api/v1/posts/1/comments.json - добавление комментария к посту. 
