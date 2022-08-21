class RequestsController < ApplicationController
  skip_before_action: authorize_admin
  skip_before_action: authorize_manager, only: [:create, :destroy]

  
end
