#Authored by : Ahmed Fathy
#Date: 2025-2-14
# Use the official Redis image from the Docker Hub
FROM redis:latest

# Expose the Redis port
EXPOSE 6379

# Start the Redis server
CMD ["redis-server"]