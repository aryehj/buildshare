class UsersController < ApplicationController

def sign_up_form
  render({ :template => "users/create.html.erb" })
end

def sign_out
  reset_session
  redirect_to("/",
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
  u.password = params.fetch(:password)
  save_status = u.save

  if save_status == true
      session[:user_id] = u.id
      redirect_to("/home",
        { :notice => "You're signed in!" }
      )
  else
      redirect_to("/",
        { :alert => "Oops. Please try again." }
      )
  end
end

  def sign_in
    render({ :template => "users/sign_in.html.erb" })
  end

  def home
    render({ :template => "users/home.html.erb" })
  end

  def authenticate
    email = params.fetch(:form_email,nil)
    pass = params.fetch(:password,nil)

    if User.where(:email => email).exists?
      u = User.where(:email => email).first
      if u.authenticate(pass) == u
        session[:user_id] = u.id
        redirect_to("/home",
            {
              :notice => "Welcome to Buildshare"
            }
          )
      else redirect_to("/sign_in",
              { :alert => "Unrecognized email or password" }
            )
      end
    else
      redirect_to("/sign_in",
          { :alert => "Unrecognized email or password" }
      )
    end
  end

  def nearby_zips
    user_zip = self.zipcode
    @nearby_zips = Array.new
    @nearby_zips.push(user_zip)
    1.upto(20) do |add_zips|
      @nearby_zips.push(user_zip + add_zips)
      @nearby_zips.push(user_zip - add_zips)
    end
    return @nearby_zips
  end

end
