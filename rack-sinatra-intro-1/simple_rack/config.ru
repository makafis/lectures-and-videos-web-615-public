# config.ru - Rackup file

require 'rack'

class App
  def call(env)
    [nil, {"Content-Type" => "text/html"}, ["Hi from #{Time.now}"]]
  end
end

run App.new