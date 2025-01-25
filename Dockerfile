# Use the Amazon Linux base image
FROM amazonlinux:latest

# Update the package manager and install required packages
RUN yum -y update && \
    yum install -y httpd curl zip unzip

# Add the Avalon zip file to the web server directory
ADD https://www.free-css.com/assets/files/free-css-templates/download/page261/avalon.zip /var/www/html/

# Set the working directory
WORKDIR /var/www/html

# Unzip the Avalon template
RUN unzip avalon.zip && \
    cp -rvf avalon/* . && \
    rm -rf avalon avalon.zip

# Set the entry point for Apache
ENTRYPOINT ["/usr/sbin/httpd"]

# Start Apache in the foreground
CMD ["-D", "FOREGROUND"]

# Expose port 80 for the web server
EXPOSE 80
