# Use NGINX base image
FROM nginx:latest

# Remove the default NGINX configuration file
RUN rm -rf /etc/nginx/conf.d/*

# Copy the NGINX configuration file for the Angular app
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy the built Angular files to the NGINX web root directory
COPY dist/DevOps-Frontend /usr/share/nginx/html

# Expose the default NGINX port
EXPOSE 80

# Command to start NGINX
CMD ["nginx", "-g", "daemon off;"]
