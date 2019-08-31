class LoginController < ApplicationController

before_action :check_auth

def check_auth
  unless session[:user_id].present?
  redirect_to("/sign_in",
    { :alert => "You must be signed in to see that page." }
  )
  end
end

end
