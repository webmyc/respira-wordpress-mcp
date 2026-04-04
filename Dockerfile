FROM node:22-slim

WORKDIR /app

RUN npm install -g @respira/wordpress-mcp-server@5.5.0

ENTRYPOINT ["respira-wordpress-mcp"]
