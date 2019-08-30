class LoginController < ApplicationController

before_action :check_auth

def check_auth
  if session[:user_id].present?
    return true
  else
    redirect_to("/sign_in",
      { :alert => "You must be signed in to see that page." }
    )
  end
end

end
