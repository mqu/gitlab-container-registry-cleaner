FROM node:lts-alpine

RUN set -x ; \
  apk add --update nodejs npm git curl bash

WORKDIR /usr/src/app

RUN set -x ; \
  git clone https://github.com/mqu/gitlab-container-registry-cleaner.git .

RUN set -x ; \
  yarn ; \
  yarn build

# CMD /usr/src/app/gitlab-container-registry-cleaner
ENTRYPOINT ["/usr/src/app/gitlab-container-registry-cleaner"]

