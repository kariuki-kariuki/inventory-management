# Load the Rails application.
require_relative "application"


config.action_cable.allowed_request_origins = "ws://localhost:4000/cable"
config.action_cable.disable_request_forgery_protection = true


# Initialize the Rails application.
Rails.application.initialize!
