ARG VARIANT=3.2-bullseye
FROM mcr.microsoft.com/vscode/devcontainers/ruby:0-${VARIANT}

ARG NODE_VERSION="18"
RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && nvm install ${NODE_VERSION} 2>&1"

ARG BUNDLER_VERSION='2.4.12'
RUN gem install bundler -v ${BUNDLER_VERSION}
ENV BUNDLE_PATH='/usr/local/bundle'

# Install Rails
ARG RAILS_VERSIONS='7.0.4.3'
RUN gem install rails -v ${RAILS_VERSIONS}
