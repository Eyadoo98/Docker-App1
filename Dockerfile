# Install node on machine This is baseImage (node:18)
FROM node:18

# Create folder name app
WORKDIR /app

# Copy folder package.json into app folder (note you can change /app to . it will lock into WORKDIR and it mean /app it's the same)
COPY package.json /app

# For run command we use RUN Keyword This will install node_modules folder for node 
RUN npm install 

# Here . mean app folder it will lock to WORKDIR and know where will put fils and folders
# COPY index.js .

# This mean copy all files and folders from my application or local machine into container machine
COPY . .

# This mean I want application inside container to work into PORT 4000 I can change number 4000 by the way
EXPOSE 4000

CMD ["npm","run","start-dev"]


