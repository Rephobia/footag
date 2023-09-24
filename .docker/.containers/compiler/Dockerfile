FROM gcc:13.2.0

ARG USER_ID

USER root

RUN groupadd --gid $USER_ID compiler \
  && useradd --uid $USER_ID --gid compiler --shell /bin/bash --create-home compiler

USER compiler

CMD ["/bin/bash"]
