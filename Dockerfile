FROM rocker/shiny:latest

RUN apt update
RUN apt install -y libjpeg-dev libssl-dev
RUN R -e 'install.packages(c("packrat"))'
RUN usermod -u 1000 shiny
RUN groupmod -g 1000 shiny
RUN chown -R shiny:shiny /var/lib/shiny-server
RUN sed -i.bak 's/directory_index on/directory_index off/g' /etc/shiny-server/shiny-server.conf

EXPOSE 3838
