FROM node:18-bullseye

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    python3 \
    git \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy package files
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install

# Copy source
COPY . .

# Build
RUN yarn build

# The executable will be in dist or something
# For electron-builder, run the build script