
# Use the official NGINX web server image
FROM nginx:stable-alpine

# Remove the default NGINX website
RUN rm -rf /usr/share/nginx/html/*

# Copy the portfolio website into NGINX
COPY . /usr/share/nginx/html/

# NGINX listens on port 80 inside the container
EXPOSE 80
