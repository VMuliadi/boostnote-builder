FROM alpine:3.9
LABEL maintainer=vmuliadi@max-metal.us
RUN apk update && \
    apk add gcc tar fakeroot curl git yarn dpkg dpkg-dev rpm --no-cache && \
    git clone https://github.com/BoostIO/Boostnote && \
    cd Boostnote; yarn install; yarn global add grunt && \
    yarn add --dev grunt-electron-installer-debian grunt-electron-installer-redhat 
WORKDIR Boostnote
ENTRYPOINT grunt build
