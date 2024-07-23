# Start with the official Node.js image to build our app
FROM node:lts AS build

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm ci

# Copy the rest of the application code
COPY . .

# Build the application (if necessary)
RUN npm install

# Start a new stage with the distroless Node.js image
FROM gcr.io/distroless/nodejs20-debian12

# Set the working directory
WORKDIR /app

# Copy the built application from the previous stage
COPY --from=build /app .

# Command to run the application
CMD ["node", "index.js"]
