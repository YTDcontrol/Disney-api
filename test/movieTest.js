var request = require('supertest');
const assert = require('chai').assert;


describe('MOVIES', function () {

    it('Get error on try to create a movie without authorization.', function (done) {
        request("http://localhost:3000")
            .post("/movies")
            .send({
                "movieImage": "https://static.wikia.nocookie.net/disney/images/a/a8/Monstruos_sa.jpg/revision/latest?cb=20110804055254&path-prefix=es",
                "name": "Monsters, Inc.",
                "releaseDate": "2001-11-02 15:20:47",
                "score": 5,
                "cast": 7
            })
            .set('Accept', 'application/json')
            .expect('Content-Type', /json/)
            .expect(401)
            .expect({
                success: false,
                error: 'A token must be provided'
            })
            .end(function (err, res) {
                if (err) return done(err);
                return done();
            });
    });

    it('Get on error on try to list all movies', (done) => {
        request("http://localhost:3000")
            .get("/movies")
            .set('Accept', 'application/json')
            .expect('Content-Type', /json/)
            .expect(401)
            .end(function (err, res) {
                if (err) return done(err);
                return done();
            });


    });




});