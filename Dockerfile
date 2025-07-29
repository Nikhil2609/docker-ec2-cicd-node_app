# Use official Node.js image
FROM node:20-alpine

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