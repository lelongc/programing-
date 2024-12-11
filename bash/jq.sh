# curl https://jsonplaceholder.typicode.com/comments | jq '.[5]'

# {
#   "postId": 1,
#   "id": 1,
#   "name": "id labore ex et quam laborum",
#   "email": "Eliseo@gardner.biz",
#   "body": "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium"
# }

# jq '.[].name'

# "excepturi sunt cum a et rerum quo voluptatibus quia"
# "ex eaque eum natus"


# -------------
#!/bin/bash

# Make an API call to JSONPlaceholder and store the output in a variable
output=$(curl -s 'https://jsonplaceholder.typicode.com/comments')

# Get the first comment (or a specific comment)
comment=$(echo $output | jq '.[0]')

# Get the name and body of the comment
name=$(echo $comment | jq -r .name)
email=$(echo $comment | jq -r .email)
body=$(echo $comment | jq -r .body)

# Output the comment details
echo "
Comment Details:
Name: ${name}
Email: ${email}
Body: ${body}
"
