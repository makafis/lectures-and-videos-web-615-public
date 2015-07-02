URLS
GET /posts
GET /posts/:id 
* GET /posts/new
POST /posts  
* GET /posts/:id/edit
PUT/PATCH /posts/:id
DELETE /posts/:id

Actions

INDEX
SHOW
NEW
CREATE
EDIT
UPDATE
DESTROY

SQL / CRUD
Retrieve / Post.all / SELECT * FROM posts
Retrieve / Post.find(id) / SELECT * FROM POSTS WHERE id = ?
Simply Displays a FORM
Create / Post.create / INSERT INTO posts VALUES ()
Simply Displays an EDIT FORM