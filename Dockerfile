FROM node:18

# Create app directory
WORKDIR /usr/src/app

# Install yarn
RUN npm install pnpm -g --no-package-lock

# Copy app source
# COPY package.json ./
# COPY yarn.lock ./
COPY . .

# Install dependencies
RUN pnpm install

# Bundle app source
RUN pnpm start

# Set environment variables
ENV NODE_ENV=production
ENV PORT=3000

# Expose port
EXPOSE 3000

# Start app
CMD [ "node", "dist/server.js" ]
