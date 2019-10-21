FROM rocker/shiny:latest

RUN apt-get update
RUN apt-get install -y libjpeg-dev libssl-dev
RUN R -e 'install.packages(c("packrat"))'
RUN usermod -u 1000 shiny
RUN groupmod -g 1000 shiny
RUN chown -R shiny:shiny /var/lib/shiny-server
RUN sed -i.bak 's/directory_index on/directory_index off/g' /etc/shiny-server/shiny-server.conf
RUN R -e 'install.packages(c("shiny", "dplyr", "magrittr", "tidyverse", "ggmap", "leaflet", "ggplot2", "shinyWidgets", "here", "tidyverse", "tidyr"))'

EXPOSE 3838
