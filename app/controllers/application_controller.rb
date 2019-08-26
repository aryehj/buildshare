class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token, raise: false
  
  def welcome
    render{ :plain => "Aryeh wuz here." }
  end 
  
end
