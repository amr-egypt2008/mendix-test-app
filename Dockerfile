# Use an appropriate base image for your Mendix application
FROM mendix/mendix-buildpack:latest

# Set environment variables
ENV MENDIX_HOME /opt/mendix
ENV M2EE_ADMIN_PORT 4444
ENV M2EE_ADMIN_PASS admin  # Replace with your desired admin password

# Copy your Mendix application files into the Docker image
COPY . ${MENDIX_HOME}/

# Expose the necessary ports for Mendix runtime
EXPOSE 8080 ${M2EE_ADMIN_PORT}

# Set the working directory
WORKDIR ${MENDIX_HOME}

# Start the Mendix runtime
CMD ["./runtime/startup.sh"]
