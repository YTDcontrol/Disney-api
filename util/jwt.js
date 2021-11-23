const jwt = require('jsonwebtoken');

const privateKey = 'UN1C4M3NT3';

exports.generateToken = (info) => {
    return jwt.sign(info, privateKey);
};

exports.validateToken = (token) => {
    try {
        return jwt.verify(token, privateKey, {
            expiresIn: "1h"
        });
    } catch(error) {
        return false;
    }
};