#Authored by : Ahmed Fathy
#Date: 2025-2-14
# Use the official Redis image from the Docker Hub
FROM redis:7.0.12

# Expose the Redis port
EXPOSE 6379

# Start the Redis server
CMD ["redis-server"]