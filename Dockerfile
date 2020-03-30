FROM node:alpine as builder

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build
 


FROM nginx

COPY --from=builder  /app/build /usr/share/nginx/html

# Copy folder build in builder phase to ngĩn hosting base
# Don't need to specify CMD because nginx will run automatically 