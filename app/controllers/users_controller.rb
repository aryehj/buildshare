Class UsersController < ApplicationController

def sign_up_form
  render({ :template => "users/create.html.erb" })
end

def sign_out
  reset_session
  redirect_to("/explore",
    { :notice => "Signed out." }
  )
end

def create
  u = User.new
  u.email = params.fetch(:form_email)
  u.name = params.fetch(:form_name)
  u.city = params.fetch(:form_city)
  u.state = params.fetch(:form_state)
  u.zipcode = params.fetch(:form_zipcode)
  u.password = params.fetch(:form_password)
  save_status = u.save

  if save_status == true
      session[:user_id] = u.id
      redirect_to("/explore",
        { :notice => "You're signed in!" }
      )
  else
      redirect_to("/explore",
        { :alert => "Oops. Please try again." }
      )
  end

  def sign_in
    render({ :template => "users/sign_in.html.erb" })
  end

end

end
