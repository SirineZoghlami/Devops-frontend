# Stage 1: Build the Angular application
FROM node:16 AS builder

# Set the working directory inside the container
WORKDIR /DEVOPS_PROJECT_FRONT

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm ci

# Copy the rest of the application code
COPY . .

# Build the application
RUN npm run build --prod

# Stage 2: Serve the built application using npm
FROM nginx:alpine

# Copy the built Angular application from the previous stage to NGINX's html directory
COPY --from=builder /DEVOPS_PROJECT_FRONT/dist/summer-workshop-angular /usr/share/nginx/html

# Expose port 80 (default port for HTTP)
EXPOSE 80

# NGINX is automatically started by the base image, no need for additional CMD or ENTRYPOINT instructions
