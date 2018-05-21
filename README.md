# README

`db:seed` is running too slow (about 33min)
You can use db dump instead of run it.
Please run command:

`gunzip -c support/dump.sql.gz | psql blog_demo_development`

Create post
`POST http://localhost:3000/posts`

Rate post
`POST http://localhost:3000/posts/1/rate`

Get N top posts
http://localhost:3000/api/v1/posts/top?limit=10

Get ips
http://localhost:3000/api/v1/author_ips