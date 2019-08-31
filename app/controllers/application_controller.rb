class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token, raise: false

  def explore
  	render({ :template => "explore/explore.html.erb" })
  end

end
