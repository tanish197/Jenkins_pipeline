# Use a Node.js v12 image as the base image
FROM node:12

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files to the container
COPY . .

# Expose the port that the application listens on (if needed)
EXPOSE 8000

# Start the application
CMD ["node", "discordBot/index.js"]
