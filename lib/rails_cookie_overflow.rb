# frozen_string_literal: true

require_relative "rails_cookie_overflow/version"
require_relative "rails_cookie_overflow/middleware"
require_relative "rails_cookie_overflow/railtie" if defined?(Rails::Railtie)
