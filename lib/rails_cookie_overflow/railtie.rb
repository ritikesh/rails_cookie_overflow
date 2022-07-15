# frozen_string_literal: true

module RailsCookieOverflow
  # Railtie to set the middleware during boot
  class Railtie < ::Rails::Railtie
    initializer "rails_cookie_overflow.insert_middleware" do |app|
      app.config.middleware.insert_before "ActionDispatch::Cookies", "RailsCookieOverflow::Middleware"
    end
  end
end
