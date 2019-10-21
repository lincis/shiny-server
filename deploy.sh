chmod 600 id_rsa
scp -o StrictHostKeyChecking=no -i id_rsa docker-compose.yml $1:~/shiny
ssh -o StrictHostKeyChecking=no -i id_rsa $1 "cd ~/shiny; docker-compose stop shiny; docker-compose pull shiny; docker-compose up -d shiny"
