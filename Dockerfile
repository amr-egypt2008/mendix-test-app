# Use an appropriate base image for your Mendix application
FROM mendixdevops/uptime-ci:latest

# Use the official Mendix Docker base image
#FROM mendix/runtime:latest

# Set environment variables
ENV JAVA_HOME='/opt/java'
ENV PATH="${JAVA_HOME}/bin:${PATH}"

# Copy your Mendix deployment archive into the container
COPY deployment/model.mda /opt/mendix/build/model/model.mda

# Set the working directory
WORKDIR /opt/mendix/build

# Expose the port Mendix runs on
EXPOSE 8080

# Start the Mendix app when the container runs
CMD ["/opt/mendix/build/start.sh"]
