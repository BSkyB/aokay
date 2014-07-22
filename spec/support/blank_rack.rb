require 'rack'
 
class BlankRack
  def call(env)
    [200, {"Content-Type" => "text/html"}, ["Hello Rack!"]]
  end
end

#Rack::Handler::WEBrick.run BlankRack.new
