FROM node:16
WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH
COPY package.json ./
COPY yarn.lock ./

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git

RUN yarn install
COPY . ./
CMD ["yarn", "start"]
