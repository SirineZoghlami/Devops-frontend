# Use the official Nginx image as the base image
FROM nginx:latest

# Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*
# Copy the built Angular files to the NGINX web root directory
COPY dist/summer-workshop-angular /usr/share/nginx/html

# Expose the default NGINX port
EXPOSE 80

# Command to start NGINX
CMD ["nginx", "-g", "daemon off;"]
