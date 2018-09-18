const express = require('express');
const mysql = require('mysql');
//var btn = document.querySelector("#submit");
let http = require('http') ; 
let fs = require('fs');

// Create connection
const db = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : 'Gogeta32!',
    database: 'you_matter'
});


// Connect
db.connect((err) => {
    if(err){
        throw err;
    }
    console.log('MySql Connected...');
});

const app = express();

//app.use(express.static('Node'));



let handleRequest = (request, response) => {

    response.writeHead(200, {
        'Content-Type': 'text/html'
    });
    fs.readFile('./discussion.html', null, function (error, data) {
        if (error) {
            response.writeHead(404);
            respone.write('Whoops! File not found!');
        } else {
            response.write(data); 
        }
        response.end();
    });
};
app.get('/', (req, res) => {
    let sql = `INSERT INTO discussion (topic) VALUES ('?') `;
    let query = db.query(sql, (err, result) => {
        if(err) throw err;
        console.log(result);
        res.send('Post fetched...');
    })
});


http.createServer(handleRequest).listen(8000);

/*
// Update post
app.get('/updatepost/:id', (req, res) => {
    let newTitle = 'Updated Title';
    let sql = `UPDATE posts SET title = '${newTitle}' WHERE id = ${req.params.id}`;
    let query = db.query(sql, (err, result) => {
        if(err) throw err;
        console.log(result);
        res.send('Post updated...');
    });
});

// Delete post
app.get('/deletepost/:id', (req, res) => {
    let newTitle = 'Updated Title';
    let sql = `DELETE FROM posts WHERE id = ${req.params.id}`;
    let query = db.query(sql, (err, result) => {
        if(err) throw err;
        console.log(result);
        res.send('Post deleted...');
    });
});
*/
