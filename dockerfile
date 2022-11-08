FROM node:19-alpine as builder
WORKDIR /app
COPY package*.json ./
RUN npm install
RUN npm install -g typescript
COPY . .
RUN ["npm", "run", "build"]

FROM node:19-alpine
RUN addgroup -S expressgroup
RUN adduser -S express -G expressgroup
WORKDIR /app
COPY --from=builder /app/package.json ./
RUN npm install --only=production
USER express
COPY --from=builder /app/build ./build
EXPOSE 3000/tcp
CMD ["node", "build/index.js"]
