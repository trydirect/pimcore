ARG COMPOSER_VERSION=latest
ARG PHP_VERSION=7.3-fpm

FROM composer:$COMPOSER_VERSION AS composer
FROM php:$PHP_VERSION AS base

ENV PIMCORE_DEPENDENCIES \
        facedetect \
        ffmpeg \
        ghostscript \
        graphviz \
        html2text \
        inkscape \
        libfontconfig1 \
        libimage-exiftool-perl \
        libmagickwand-dev \
        libreoffice \
        libreoffice-math \
        libreoffice-script-provider-python \
        libxrender1 \
        locales-all \
        poppler-utils \
        webp \
        xfonts-75dpi

ENV PHP_DEPENDENCIES \
        libicu-dev \
        libzip-dev \
        unzip \
        zip \
        git

SHELL ["/bin/bash", "-c"]

# dependencies
RUN apt-get update -qq && apt-get install -qq -y --no-install-recommends --no-install-suggests \
        npm \
        $PIMCORE_DEPENDENCIES \
        $PHP_DEPENDENCIES \
    && curl -sSL https://github.com/imagemin/advpng-bin/raw/master/vendor/linux/advpng -o /usr/bin/advpng \
    && curl -sSL https://github.com/imagemin/mozjpeg-bin/raw/master/vendor/linux/cjpeg -o /usr/bin/cjpeg \
    && curl -sSL https://github.com/imagemin/jpegoptim-bin/raw/master/vendor/linux/jpegoptim -o /usr/bin/jpegoptim \
    && curl -sSL https://github.com/imagemin/pngcrush-bin/raw/master/vendor/linux/pngcrush -o /usr/bin/pngcrush \
    && curl -sSL https://github.com/imagemin/pngout-bin/raw/master/vendor/linux/x64/pngout -o /usr/bin/pngout \
    && curl -sSL https://github.com/imagemin/zopflipng-bin/raw/master/vendor/linux/zopflipng -o /usr/bin/zopflipng \
    && chmod +x /usr/bin/{advpng,cjpeg,jpegoptim,pngcrush,pngout,zopflipng} \
    && docker-php-ext-install -j$(nproc) \
        exif \
        gd \
        iconv \
        intl \
        mysqli \
        opcache \
        pdo_mysql \
        zip \
    && pecl install \
        imagick \
    && docker-php-ext-enable \
        imagick \
    && npm install --global sqip \
    # clean up
    && rm -rf /tmp/* /var/lib/apt/lists/* /root/.npm/_cacache/* \
    # smoke tests
    && node --version \
    && sqip --help

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN composer global --prefer-dist require hirak/prestissimo

WORKDIR /var/www/html


#
# dev stage
#
FROM base AS dev

ARG PIMCORE_DEMO_VERSION=1.2.5

RUN pecl install \
        xdebug \
    && docker-php-ext-enable \
        xdebug \
    # smoke tests
    && set -ex \
    && ( \
      o=$(php -m | grep "xdebug") \
      && test "$o" = "xdebug" \
    )

RUN COMPOSER_MEMORY_LIMIT=-1 composer create-project pimcore/demo=${PIMCORE_DEMO_VERSION} pimcore \
    && mv /var/www/html/pimcore/* /var/www/html/ \
    && rm -rf /root/.composer/*


#
# prod stage
#
FROM base AS prod

ARG PIMCORE_SKELETON_VERSION=2.4.2

SHELL ["/bin/bash", "-c"]

RUN pecl install \
        redis \
    && docker-php-ext-enable \
        redis \
    # smoke tests
    && set -ex \
    && ( \
      o=$(php -m | grep "redis") \
      && test "$o" = "redis" \
    )

RUN groupadd --gid 2000 pimcore \
    && adduser --shell /bin/true --uid 2000 --gid 2000 --disabled-password --no-create-home --gecos '' pimcore \
    && chown -R pimcore:pimcore /var/www/ \
    # remove world-writeable permissions except for /tmp/
    && find / -xdev -type d -perm /0002 -exec chmod o-w {} + \
    && find / -xdev -type f -perm /0002 -exec chmod o-w {} + \
    && chmod 777 /tmp/ \
    && chown pimcore:root /tmp/ \
    # remove unnecessary accounts, excluding current pimcore and root users
    && sed -i -r '/^(pimcore|root|nobody)/!d' /etc/group \
    && sed -i -r '/^(pimcore|root|nobody)/!d' /etc/passwd \
    # remove interactive login shell for everybody
    && sed -i -r 's#^(.*):[^:]*$#\1:/sbin/nologin#' /etc/passwd \
    # disable password login for everybody
    && ( \
      while IFS=: read -r username _; do passwd -l "$username"; done < /etc/passwd || true \
    ) \
    # remove temporal shadow, passwd and group files
    && find /bin /etc /lib /sbin /usr -xdev -type f -regex ".*-$" -exec rm -f {} + \
    # ensure system dirs are owned by root and not writable by anybody else
    && find /bin /etc /lib /sbin /usr -xdev -type d -exec chown root:root {} \; -exec chmod 0755 {} \; \
    # remove suid & sgid files
    && find /bin /etc /lib /sbin /usr -xdev -type f -a \( -perm /4000 -o -perm /2000 \) -delete \
    # remove apt package manager
    && find / -type f -iname "*apt*" -xdev -delete \
    && find / -type d -iname "*apt*" -print0 -xdev | xargs -0 rm -rf -- \
    # remove any symlinks that we broke during previous steps
    && find /bin /etc /lib /sbin /usr -xdev -type l -exec test ! -e {} \; -delete \
    && rm -rf /root /etc/fstab

RUN COMPOSER_MEMORY_LIMIT=-1 composer --prefer-dist create-project pimcore/skeleton=${PIMCORE_SKELETON_VERSION} pimcore \
    && mv /var/www/html/pimcore/* /var/www/html/ \
    && chown -R pimcore:pimcore /var/www/ \
    && chmod 700 /var/www/ \
    && rm -rf /root/.composer/* \
    # remove potentially risky commands
    && find /bin /etc /lib /sbin /usr -xdev \( \
        -name chgrp -o \
        -name chown -o \
        -name dd -o \
        -name mv -o \
        -name ln -o \
        -name od -o \
        -name strings -o \
        -name shred -o \
        -name su \
    \) -delete \
    && rm -f /usr/bin/curl

COPY ./configs/php/fpm/php.ini $PHP_INI_DIR/conf.d/
COPY ./configs/php/www.conf /usr/local/etc/php-fpm.d/www.conf

USER pimcore
