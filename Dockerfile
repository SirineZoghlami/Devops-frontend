# Stage 1: Build the Angular application
FROM node:16 AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./
# Install dependencies
RUN npm ci

# Copy the rest of the application code
COPY . .

# Build the application
RUN npm run build --prod

# Stage 2: Serve the built application using npm
FROM node:16-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the built Angular application from the previous stage
COPY --from=builder /app/dist/summer-workshop-angular .

# Install serve globally
RUN npm install -g serve

# Expose port 8888 (can be changed to any desired port)
EXPOSE 8888

# Start the Angular application using npm start
CMD ["npm", "start"]