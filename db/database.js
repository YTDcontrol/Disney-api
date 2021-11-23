const {Sequelize} = require('sequelize');

const db = new Sequelize({
    database: 'disney_api',
    username: 'root',
    password: '',
    dialect: 'mysql',
    host: 'localhost'
});

module.exports = db;