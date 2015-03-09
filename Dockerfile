FROM eboraas/apache

RUN rm /etc/apache2/sites-available/*
RUN rm /etc/apache2/sites-enabled/*

ADD apps/* /etc/apache2/sites-available/*