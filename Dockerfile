# Use an official Node.js runtime as a base image
FROM node:14

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install application dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Expose the port your Nest.js application will run on
EXPOSE 3000

# Start your Nest.js application
CMD ["npm", "start"]
