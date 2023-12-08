# Use an official Node.js runtime as a parent image
FROM node:14-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and yarn.lock to the working directory
COPY package.json yarn.lock ./

RUN ls -al /app

# Install app dependencies
RUN yarn install

# Copy the entire project to the working directory
COPY . .

# Build the Next.js application
RUN yarn build

EXPOSE 39209

ENV PORT 39209

# set hostname to localhost
ENV HOSTNAME "0.0.0.0"

# Set environment variables
ENV NODE_ENV=production
ENV NEXT_TELEMETRY_DISABLED 1

# Run the application
CMD ["yarn", "start"]
