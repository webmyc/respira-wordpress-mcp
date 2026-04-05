FROM node:22-slim

WORKDIR /app

RUN npm install -g @respira/wordpress-mcp-server@latest

ENTRYPOINT ["respira-wordpress-mcp"]
