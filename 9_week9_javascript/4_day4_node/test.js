// Modules required
    //Create the server
    var http = require('http');
    //Manage urls
    var url = require('url');
    //Manage queries in the url
    var querystring = require('querystring');

//Basic code of the page
var server = http.createServer(function(req, res) {
  var page = url.parse(req.url).pathname;
  var params = querystring.parse(url.parse(req.url).query);
    console.log(page);
    res.writeHead(200, {"Content-Type": "text/plain"});
    if ('prenom' in params && 'nom' in params) {
        res.write('Vous vous appelez ' + params['prenom'] + ' ' + params['nom']);
    }
    else {
        res.write('Vous devez bien avoir un prénom et un nom, non ?');
    }
    res.end();

});
server.listen(8080);