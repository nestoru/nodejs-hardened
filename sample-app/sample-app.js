// content of index.js
const http = require('http')  
const port = 9999

const requestHandler = (request, response) => {  
  console.log(request.url)
  response.end('Greetings! You hit ' + request.url)
}

const server = http.createServer(requestHandler)

server.listen(port, (err) => {  
  if (err) {
    return console.log (err)
  }

  console.log(`Server listening on ${port}`)
})
