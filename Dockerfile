FROM node:18

# Create app directory
WORKDIR /usr/src/app

# Install yarn
RUN npm install pnpm --no-package-lock

# Copy app source
# COPY package.json ./
# COPY yarn.lock ./
COPY . .

# Install dependencies
RUN pnpm install --no-frozen-lockfile

# Bundle app source
RUN pnpm build

# Set environment variables
ENV NODE_ENV=production
ENV PORT=3000

# Expose port
EXPOSE 3000

# Start app
CMD [ "node", "dist/server.js" ]
