require 'rack'
 
class BlankRack

  def call(env)
    [200, {"Content-Type" => "text/html"}, [content]]
  end

  private

  def content
    <<-HTML
      <!doctype html>
      <html lang="en">
        <head>
          <meta charset="utf-8">
        </head>
        <body>
          Everything is Aokay
        </body>
      </html>
    HTML
  end

end

#Rack::Handler::WEBrick.run BlankRack.new
