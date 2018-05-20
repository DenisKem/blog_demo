puts `curl --header "Content-Type: application/json" \
  --request POST \
  --data '{"author_login":"test", "author_ip":"0.0.0.0", "content": "Hello, world!", "title": "Greetings"}' \
  http://localhost:3000/api/v1/posts`