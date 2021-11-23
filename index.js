const express = require('express');
const bodyParser = require('body-parser');
const db = require('./db/database');

const userRoutes = require('./routes/user');
const characterRoutes = require('./routes/character');
const movieRoutes = require('./routes/movie');
const genreRoutes = require('./routes/genre');

const bcrypt = require('bcryptjs');

const server = express();

module.exports = server;  // 

server.set('port', process.env.PORT || 3000);

server.use(bodyParser.json());


server.use('/auth', userRoutes);
server.use('/movies', movieRoutes);
server.use('/characters', characterRoutes);
server.use('/genre', genreRoutes);

server.get('/', (req, res) => {
    console.log(bcrypt.hashSync('admin', 10));
});

db.authenticate().then(() => {
        console.log('Connection to DB successful, initializing server');
    })
    .then(() => {
        server.listen(server.get('port'), () => {
            console.log(`Server up and listening on port ${server.get('port')}`);
        });
    })
    .catch(() => console.error('There was an error initializing Server and/or DB'));