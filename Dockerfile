# Use an appropriate base image for your Mendix application
FROM mendixdevops/uptime-ci:latest

# Set environment variables
ENV M2EE_ADMIN_PORT 4444
ENV M2EE_ADMIN_PASS admin  # Replace with your desired admin password

# Copy your Mendix application deployment package into the Docker image
COPY App.mda /opt/mendix/data/model/

# Expose the necessary ports for Mendix runtime
EXPOSE 8080 ${M2EE_ADMIN_PORT}

# Start the Mendix runtime
CMD ["bash", "-c", "/usr/bin/start-mendix && tail -f /opt/mendix/log/*.log"]

