# Use official Node.js image
FROM public.ecr.aws/docker/library/node:20-alpine

# set working directory
WORKDIR /app

# Copy only package files first
COPY package.json ./
COPY package-lock.json ./
COPY tsconfig.json ./
COPY buildspec.yml ./

# Install app dependencies
RUN npm install

COPY src ./src

# Build typescript app
RUN npm run build

# Start the app
CMD ["npm", "start"]

#2 [internal] load metadata for docker.io/library/node:20-alpine
#2 ERROR: failed to copy: httpReadSeeker: failed open: unexpected status code https://registry-1.docker.io/v2/library/node/manifests/sha256:ae6ee91a652d927de01d550c29f863a52f1da390c89df95f3ceba256d1e62604: 429 Too Many Requests - Server message: toomanyrequests: You have reached your unauthenticated pull rate limit. https://www.docker.com/increase-rate-limit
------
 > [internal] load metadata for docker.io/library/node:20-alpine:
------
Dockerfile:2
--------------------
   1 |     # Use official Node.js image
   2 | >>> FROM node:20-alpine
   3 |     
   4 |     # set working directory
--------------------