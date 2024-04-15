# Stage 1: Build the Angular application
FROM node:latest AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the application
RUN npm run build --prod

# Stage 2: Serve the built application using NGINX
FROM nginx:latest

# Remove default NGINX content
RUN rm -rf /usr/share/nginx/html/*

# Copy the built Angular application to NGINX web root directory
COPY --from=builder /app/dist/summer-workshop-angular /usr/share/nginx/html

# Expose port 80 (NGINX's default port)
EXPOSE 80

# Start NGINX with daemon off directive
CMD ["nginx", "-g", "daemon off;"]
