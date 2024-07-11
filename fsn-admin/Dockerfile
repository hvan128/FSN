# Use the official Node.js 18 Alpine base image
FROM node:18-alpine AS base

# Install necessary packages
RUN apk add --no-cache libc6-compat
RUN apk add --no-cache --virtual .gyp python3 make g++ 

# Create and set the working directory
WORKDIR /app

# Copy package.json and lock files
COPY package.json yarn.lock* package-lock.json* pnpm-lock.yaml* ./

# Install dependencies
RUN \
  if [ -f yarn.lock ]; then yarn install --frozen-lockfile; \
  elif [ -f package-lock.json ]; then npm ci; \
  elif [ -f pnpm-lock.yaml ]; then corepack enable pnpm && pnpm install --frozen-lockfile; \
  else echo "Lockfile not found." && exit 1; \
  fi

# Copy the rest of the application code
COPY . .

# Build the application
RUN \
  if [ -f yarn.lock ]; then yarn build; \
  elif [ -f package-lock.json ]; then npm run build; \
  elif [ -f pnpm-lock.yaml ]; then corepack enable pnpm && pnpm run build; \
  else echo "Lockfile not found." && exit 1; \
  fi

# Create the final image for running the application
FROM node:18-alpine AS runner

# Set environment variables
ENV NODE_ENV=production
ENV PORT=3000

# Create and set the working directory
WORKDIR /app

# Add a user to run the application
RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 nextjs

# Copy the built application and node_modules from the build stage
COPY --from=base /app/.next ./.next
COPY --from=base /app/public ./public
COPY --from=base /app/node_modules ./node_modules
COPY --from=base /app/package.json ./package.json

# Set the correct permissions for the application files
RUN chown -R nextjs:nodejs /app

# Switch to the non-root user
USER nextjs

# Expose the application port
EXPOSE 3000

# Start the application
CMD ["node_modules/.bin/next", "start"]
