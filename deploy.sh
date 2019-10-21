chmod 600 deploy_key
scp -o StrictHostKeyChecking=no -i deploy_key docker-compose.yml $1:~/shiny
ssh -o StrictHostKeyChecking=no -i deploy_key $1 "cd ~/shiny; docker-compose stop shiny; docker-compose pull shiny; docker-compose up -d shiny"
