Rails.application.routes.draw do

match("/", {
    :controller => "application", 
    :action => "welcome",
    :via => "get"
           }
     )
  
  # ==============
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
