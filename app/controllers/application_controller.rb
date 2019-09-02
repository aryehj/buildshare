class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token, raise: false

  def check_auth
    unless session[:user_id].present?
    redirect_to("/sign_in",
      { :alert => "You must be signed in to see that page." }
    )
    end
  end

  def explore
  	render({ :template => "explore/explore.html.erb" })
  end

end
