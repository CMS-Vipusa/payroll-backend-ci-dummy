# Use small Node image for runtime
FROM node:20-alpine

# Set working directory
WORKDIR /app

RUN apk add --no-cache wget

# Copy package.json and package-lock.json first
COPY package*.json ./

# Install only production dependencies
RUN npm ci --only=production

# Copy source code
COPY src ./src

# Expose port
EXPOSE 4000

# Start the app
CMD [ "node", "src/server.js"]
