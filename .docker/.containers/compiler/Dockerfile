FROM gcc:13.2.0

ARG USER_ID

RUN set -ex \
  && for key in C6C265324BBEBDC350B513D02D2CEF1034921684; do \
    gpg --keyserver hkps://keyserver.ubuntu.com --recv-keys "$key" || \
    gpg --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys "$key" || \
    gpg --keyserver hkp://ipv4.pool.sks-keyservers.net --recv-keys "$key" || \
    gpg --keyserver hkp://pgp.mit.edu:80 --recv-keys "$key" ; \
  done

ENV CMAKE_SOURCE https://github.com/Kitware/CMake/releases/download
ENV CMAKE_VERSION 3.27.6

RUN set -ex \
  && curl -OL ${CMAKE_SOURCE}/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-linux-x86_64.tar.gz \
  && curl -OL ${CMAKE_SOURCE}/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-SHA-256.txt.asc \
  && curl -OL ${CMAKE_SOURCE}/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-SHA-256.txt \
  && gpg --verify cmake-${CMAKE_VERSION}-SHA-256.txt.asc cmake-${CMAKE_VERSION}-SHA-256.txt \
  && sha256sum -c --ignore-missing cmake-${CMAKE_VERSION}-SHA-256.txt \
  && tar xzf cmake-${CMAKE_VERSION}-linux-x86_64.tar.gz -C /usr/local --strip-components=1 --no-same-owner \
  && rm -rf cmake-${CMAKE_VERSION}*

USER root

RUN groupadd --gid $USER_ID compiler \
  && useradd --uid $USER_ID --gid compiler --shell /bin/bash --create-home compiler

USER compiler

CMD ["/bin/bash"]
