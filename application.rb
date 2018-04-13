app_files = File.expand_path('../app/**/*.rb', __FILE__)
Dir.glob(app_files).each { |file| require(file) }

class Application
  def call(env)
  	serve_request(Rack::Request.new(env))
    # ['200', {'Content-Type' => 'text/html'}, ["Hello from the App!"]]
  end
 
  def serve_request(request)
  	Router.new(request).route!
  end

end
