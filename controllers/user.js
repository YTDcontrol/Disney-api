require('dotenv').config();
const bcrypt = require('bcryptjs');
const { generateToken } = require('../util/jwt');
const db = require('../db/database');
const sgMail = require('@sendgrid/mail');

const saltRounds = 10;

const {
    QueryTypes
} = require('sequelize');

// Setup email engine
sgMail.setApiKey("SENDGRID_API_KEY");

exports.login = (req, res) => {
    const {
        username,
        password
    } = req.body;
    db.query('SELECT * FROM users WHERE username = ?', {
        type: QueryTypes.SELECT,
        replacements: [username]
    })
        .then((queryResponse) => {
            const user = queryResponse[0];
            if (user) {
                const pwCorrect = bcrypt.compareSync(password, user.password);
                if (pwCorrect) {
                    // 1. Generate Token
                    const token = generateToken({
                        user_id: user.user_id,
                        username: user.username,
                        is_admin: Boolean(user.is_admin)
                    });
                    // 2. Send user and token to client
                    res.status(200).json({
                        success: true,
                        user_id: user.user_id,
                        accessToken: token,
                        username: user.username,
                        is_admin: Boolean(user.is_admin)
                    });
                } else {
                    res.status(401).json({
                        success: false,
                        error: "Wrong password"
                    });
                }
            } else {
                res.status(401).json({
                    success: false,
                    error: `Username (${username}) not found`
                });
            }
        })
        .catch(error => res.status(500).json({
            error: "Server Internal Error",
            errorData: error,
            success: false
        }));
};

exports.register = (req, res) => {
    const {
        username,
        password,
        fullname,
        email,
        is_admin
    } = req.body;

    const hashedPassword = bcrypt.hashSync(password, saltRounds);

    db.query('INSERT INTO users (username, password, fullname, email, is_admin) VALUES (?, ?, ?, ?, ?)', {
        type: QueryTypes.INSERT,
        replacements: [username, hashedPassword, fullname, email, is_admin]
    })
        .then((response) => {
            res.status(201).json({
                success: true,
                msg: "User created successfully, verify email inbox!"
            });

            const msg = {
                to: email,
                //to: 'ytdcontrol@gmail.com',
                from: 'adriansosa105@gmail.com',
                subject: 'Welcome to Alkemy Disney App',
                text: 'Hello! Welcome to Disney. Here you can learn and update Disney movies.',
                html: '<div><h2>Ask yourself if what you are doing today will get you where you want to be tomorrow.<br><br></br><h3>Walt Disney</br></h3></h2></div>',
            }
            // Sending e-mail
            sgMail
                .send(msg)
                .then(() => {
                    console.log('Email sent')
                })
                .catch((error) => {
                    console.error(error)
                });
        })
        .catch(error => res.status(500).json({
            error: "Server Internal Error",
            errorData: error,
            success: false
        }));
};
// Gettin al users
exports.getAllUsers = (req, res) => {
    db.query('SELECT * FROM users', {
        type: QueryTypes.SELECT
    })
        .then(users => res.json(users))
        .catch(error => res.status(500).json({
            error: "Server Internal Error",
            success: false
        }));
};
// Geting specific user
exports.getUserById = (req, res) => {
    const {
        userId
    } = req.params;


    db.query('SELECT * FROM users WHERE user_id = ?', {
        type: QueryTypes.SELECT,
        replacements: [userId]
    })
        .then(users => res.json({
            user: users[0]
        }))
        .catch(error => res.status(500).json({
            error: "Server Internal Error",
            success: false
        }));
};
// Updating user by id
exports.editUserById = (req, res) => {
    const {
        userId
    } = req.params;

    const {
        username,
        password,
        fullname,
        email
    } = req.body;

    const hashedPassword = bcrypt.hashSync(password, 10);
    db.query('UPDATE users SET username = ?, password = ?, fullname = ?, email = ? WHERE user_id = ?', {
        type: QueryTypes.UPDATE,
        replacements: [username, hashedPassword, fullname, email, userId]
    })
        .then(() => {
            res.status(201).json({
                success: true,
                msg: "User updated successfully",
            });
        })
        .catch(err => {
            res.status(500).json({
                success: false,
                error: 'Server internal error'
            });
        });
};
// Deleting user by id
exports.deleteUserById = (req, res) => {
    const {
        userId,
        user
    } = req.params;

    db.query('DELETE FROM users WHERE user_id = ?', {
        type: QueryTypes.DELETE,
        replacements: [userId]
    })
        .then(() => res.json({
            success: true,
            msg: "User deleted successfully",
            deletedUser: user
        }))
        .catch(error => res.status(500).json({
            error: "Server Internal Error",
            success: false
        }));
};
