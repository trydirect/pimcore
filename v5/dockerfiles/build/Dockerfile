FROM ubuntu:16.04
<<<<<<< HEAD

RUN apt-get update -y -qq; apt-get install -y -qq software-properties-common --no-install-recommends; \
    LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php -y; apt-get update -y -qq; \
    apt-get install -y -qq nginx sudo supervisor wget php7.2-fpm php7.2-common php7.2-mbstring php7.2-xmlrpc php7.2-soap \
    php7.2-gd php7.2-xml php7.2-intl php7.2-mysql php7.2-cli php7.2-zip php7.2-bz2 php7.2-curl php7.2-imagick php7.2-apcu \
    php7.2-redis  libreoffice  libreoffice-math xfonts-75dpi poppler-utils inkscape libxrender1 libfontconfig1 \
    ghostscript python-setuptools libimage-exiftool-perl cron golang-go npm unzip git procps curl \
    && apt-get clean && rm -rf /var/lib/apt/lists/*;

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- \
        --filename=composer \
        --install-dir=/usr/local/bin && \
        echo "alias composer='composer'" >> /root/.bashrc && \
        composer
=======
RUN apt-get update -y -qq; apt-get install --no-install-recommends -y -qq software-properties-common; \
    LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php -y; apt-get update -y -qq; \
    apt-get install --no-install-recommends -y -qq nginx sudo supervisor wget php7.1-fpm php7.1-common php7.1-mbstring php7.1-xmlrpc php7.1-soap \
    php7.1-gd php7.1-xml php7.1-intl php7.1-mysql php7.1-cli php7.1-zip php7.1-bz2 php7.1-curl php7.1-imagick php7.1-apcu \
    php7.1-redis  libreoffice  libreoffice-math xfonts-75dpi poppler-utils inkscape libxrender1 libfontconfig1 \
    ghostscript python-setuptools libimage-exiftool-perl cron golang-go npm unzip git procps && apt-get clean \
    && apt-get autoclean && apt-get autoremove -y -qq
>>>>>>> testing

RUN easy_install uno; \
    npm install -g sqip; \
    rm -rf /etc/nginx/sites-available/default; rm -rf /etc/nginx/sites-enabled/default;  mkdir /run/php; \
    mkdir -p /opt/letsencrypt; \
<<<<<<< HEAD
=======
    wget https://pimcore.com/download-5/pimcore-latest.zip -O /usr/src/pimcore-install.zip; \
    chown www-data:www-data  /usr/src/pimcore-install.zip;  www-data:www-data /var/www; \
>>>>>>> testing
    wget https://johnvansickle.com/ffmpeg/builds/ffmpeg-git-64bit-static.tar.xz; \
    tar -Jxf ffmpeg*.tar.xz; \
    rm ffmpeg*.tar.xz; \
    mv ffmpeg-* /usr/local/ffmpeg; \
    ln -s /usr/local/ffmpeg/ffmpeg /usr/local/bin/; \
    ln -s /usr/local/ffmpeg/ffprobe /usr/local/bin/; \
    ln -s /usr/local/ffmpeg/qt-faststart /usr/local/bin/; \
    ln -s /usr/local/ffmpeg/qt-faststart /usr/local/bin/qtfaststart; \
    wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz; \
    tar -Jxf wkhtmltox*.tar.xz; \
    rm -rf wkhtmltox*.tar.xz ; \
    mv wkhtmltox /usr/local/; \
    ln -s  /usr/local/wkhtmltox/bin/wkhtmltoimage  /usr/local/bin/wkhtmltoimage; \
    wget https://files.pythonhosted.org/packages/dd/79/f8387c4e82275a7b540e0b948d261a636eb5aedd1d23be8ca05fbf605726/html2text-2018.1.9.tar.gz; \
    tar -xzf  html2text*.tar.gz; \
    rm -rf html2text*.tar.gz; \
    cd html2text* ; python setup.py  install; \
    rm -rf /html2text*; \
    wget https://github.com/imagemin/zopflipng-bin/raw/master/vendor/linux/zopflipng -O /usr/local/bin/zopflipng; \
    chmod 0755 /usr/local/bin/zopflipng; \
    wget https://github.com/imagemin/pngcrush-bin/raw/master/vendor/linux/pngcrush -O /usr/local/bin/pngcrush; \
    chmod 0755 /usr/local/bin/pngcrush; \
    wget https://github.com/imagemin/jpegoptim-bin/raw/master/vendor/linux/jpegoptim -O /usr/local/bin/jpegoptim; \
    chmod 0755 /usr/local/bin/jpegoptim; \
    wget https://github.com/imagemin/pngout-bin/raw/master/vendor/linux/x64/pngout -O /usr/local/bin/pngout; \
    chmod 0755 /usr/local/bin/pngout; \
    wget https://github.com/imagemin/advpng-bin/raw/master/vendor/linux/advpng -O /usr/local/bin/advpng; \
    chmod 0755 /usr/local/bin/advpng; \
    wget https://github.com/imagemin/mozjpeg-bin/raw/master/vendor/linux/cjpeg -O /usr/local/bin/cjpeg; \
    chmod 0755 /usr/local/bin/cjpeg;

<<<<<<< HEAD
RUN echo "opcache.enable=1" >> /etc/php/7.2/fpm/php.ini && \
    echo "opcache.enable=1" >> /etc/php/7.2/cli/php.ini && \
    phpenmod opcache && \
    php -i | grep opcache

# Too long to wait
RUN composer global require hirak/prestissimo
RUN COMPOSER_MEMORY_LIMIT=-1 SYMFONY_ENV=prod composer create-project pimcore/demo-basic /usr/src/pimcore --no-dev

RUN groupadd -r -g 2000 pimcore; useradd -r -u 2000 -g 2000 -m -c "app account" -d /home/pimcore -s /bin/bash pimcore
=======
RUN echo "opcache.enable=1" >> /etc/php/7.1/fpm/php.ini && \
    echo "opcache.enable=1" >> /etc/php/7.1/cli/php.ini && \
    phpenmod opcache && \
    php -i | grep opcache

RUN wget https://raw.githubusercontent.com/composer/getcomposer.org/76a7060ccb93902cd7576b67264ad91c8a2700e2/web/installer -O - -q | php -- --quiet
RUN mv composer.phar /usr/local/bin/composer

RUN groupadd -r -g 2000 pimcore; useradd -r -u 2000 -g 2000 -m -c "app account" -d /home/pimcore -s /bin/bash pimcore
RUN chown -R pimcore. /usr/src
>>>>>>> testing

USER pimcore
RUN composer global require hirak/prestissimo
WORKDIR /var/www/html
# Too long to wait
RUN COMPOSER_MEMORY_LIMIT=-1 composer create-project pimcore/demo-basic /usr/src/pimcore --no-dev

USER root
RUN touch /var/run/nginx.pid && \
  mkdir -p /var/cache/nginx && \
  chown -R pimcore:pimcore /var/run/nginx.pid && \
  chown -R pimcore:pimcore /var/cache/nginx && \
  chown -R pimcore:pimcore /var/log

COPY ./configs/php/fpm/php.ini /etc/php/7.2/fpm/php.ini
COPY ./configs/php/www.conf /etc/php/7.2/fpm/pool.d/www.conf
COPY ./configs/supervisord/pimcore.conf /etc/supervisor/conf.d/pimcore.conf
COPY ./scripts/letsencrypt-auto /opt/letsencrypt/letsencrypt-auto
RUN chmod +x /opt/letsencrypt/letsencrypt-auto; /opt/letsencrypt/letsencrypt-auto  --os-packages-only --install-only --non-interactive

ENV GOPATH="/usr/local"
ENV PATH=$PATH:$GOPATH/bin

RUN go get -u github.com/fogleman/primitive; apt-get purge -qq -y npm software-properties-common  python-setuptools wget git; \
    apt-get clean; apt-get autoclean; \
    apt-get autoremove -y -qq

USER pimcore
