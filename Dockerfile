# Use an official Node.js image as the base image
FROM node:20

# Create and change to the app directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Set environment variables
ARG DATABASE_URL
ENV DATABASE_URL=$DATABASE_URL

# Generate Prisma client
RUN npx prisma generate

# Run Database Migrations
RUN npx prisma migrate deploy

# Expose port 5000
EXPOSE 5000

# Command to run the backend server
CMD ["npm", "run", "start"]
