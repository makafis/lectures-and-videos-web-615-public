# config.ru

class AddContentType
  def initialize(app)
    puts "Loaded #{self} from #{app}"
    @app = app
  end

  def call(env)
    puts "Called #{self} with #{@app}"

    status, headers, body = @app.call(env)
    
    # TODO: Add "Content-Type" to the HTTP
    #       headers and return the response.
    [status, headers.merge("Content-Type" => "text/html"), body]
  end
end

class MyApp
  def initialize
    puts "Loaded #{self}"
  end

  def call(env)
    puts "Called #{self}"
    return [200, {}, ["Hello world!"]]
  end
end

use Rack::ContentLength
use Rack::Lint
use AddContentType
# TODO: Tell the app to use the "AddContentType" middleware.

run MyApp.new
