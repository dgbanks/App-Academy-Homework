class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
end


# the controllers we make will inherit from
# ApplicationController, much like the ActiveRecord
# inheritance chain

# protect_from_forgery helps protect against CSRF
# (cross-site request forgery)
