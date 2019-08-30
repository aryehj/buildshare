class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token, raise: false

  def home
  	render({ :template => "explore/home.html.erb" })
  end

end
