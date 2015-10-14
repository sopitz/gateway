FROM eboraas/apache

RUN rm /etc/apache2/sites-available/*
RUN rm /etc/apache2/sites-enabled/*


ADD ssl /etc/ssl


ADD apps /apps
RUN chmod 777 /apps
RUN cp /apps/blog /etc/apache2/sites-available/
RUN cp /apps/loverevolution /etc/apache2/sites-available/
RUN cp /apps/registry /etc/apache2/sites-available/
RUN cp /apps/eventsos /etc/apache2/sites-available/
RUN ln -s /etc/apache2/sites-available/blog /etc/apache2/sites-enabled/blog.conf
RUN ln -s /etc/apache2/sites-available/loverevolution /etc/apache2/sites-enabled/loverevolution.conf
RUN ln -s /etc/apache2/sites-available/registry /etc/apache2/sites-enabled/registry.conf
RUN ln -s /etc/apache2/sites-available/eventsos /etc/apache2/sites-enabled/eventsos.conf

RUN a2enmod proxy_http
RUN a2enmod ssl
RUN /etc/init.d/apache2 restart
CMD /etc/init.d/apache2 restart && /bin/bash
# add all apps to sites-available
# add all apps to be enabled
