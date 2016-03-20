#!/usr/bin/env ruby

require "webrick"

class MyServlet < WEBrick::HTTPServlet::AbstractServlet
    def do_GET (request, response)
    status, content_type, body = webrick_build request

    response.status = 200
    response['Content-Type'] = 'text/plain'
    response.body = 'Hello, World!'
  end
end

def webrick_build request
    return 200, 'text/plain'
  end

server = WEBrick::HTTPServer.new(:Port => 1234)

server.mount "/", MyServlet

trap("INT") {
  server.shutdown
}

server.start