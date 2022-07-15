# frozen_string_literal: true

module RailsCookieOverflow
  # Middleware that handles the CookieOverflow exception gracefully
  # and returns 422 Unprocessable Entity when raised
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      @app.call(env)
    rescue ActionDispatch::Cookies::CookieOverflow
      [422, { "Content-Type" => "text/plain" }, ["Unprocessable Entity"]]
    end
  end
end
