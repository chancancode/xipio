module Xipio
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      if env['HTTP_HOST'] =~ /\.xip\.io(:\d+)?\z/
        ActionDispatch::Http::URL.tld_length = 6
      else
        ActionDispatch::Http::URL.tld_length = 1
      end

      @app.call(env)
    end
  end
end
