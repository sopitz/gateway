FROM eboraas/apache

RUN rm /etc/apache2/sites-available/*
RUN rm /etc/apache2/sites-enabled/*

ADD apps /apps
RUN chmod 777 /apps
RUN cp /apps/blog /etc/apache2/sites-available/
RUN ln -s /etc/apache2/sites-available/blog /etc/apache2/sites-enabled/blog.conf

RUN a2enmod proxy_http
RUN /etc/init.d/apache2 restart
CMD /etc/init.d/apache2 restart && /bin/bash
# add all apps to sites-available
# add all apps to be enabled
