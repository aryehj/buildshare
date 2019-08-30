Rails.application.routes.draw do


  # user routes

  match("/sign_up",
    {
      :controller => "users",
      :action => "sign_up_form",
      :via => "get"
    }
  )

  match("/sign_out",
    {
      :controller => "users",
      :action => "sign_out",
      :via => "get"
    }
  )

  match("/insert_user",
    {
      :controller => "users",
      :action => "create",
      :via => "post"
    }
  )

  match("/sign_in",
    {
      :controller => "users",
      :action => "sign_in",
      :via => "get"
    }
  )

  # Routes for the Stakeholder resource:

  # CREATE
  match("/insert_stakeholder", { :controller => "stakeholders", :action => "create", :via => "post"})

  # READ
  match("/stakeholders", { :controller => "stakeholders", :action => "index", :via => "get"})

  match("/stakeholders/:route_stakeholder_id", { :controller => "stakeholders", :action => "show", :via => "get"})

  # UPDATE

  match("/modify_stakeholder/:route_stakeholder_id", { :controller => "stakeholders", :action => "update", :via => "post"})

  # DELETE
  match("/delete_stakeholder/:route_stakeholder_id", { :controller => "stakeholders", :action => "destroy", :via => "get"})

  #------------------------------

  # Routes for the Commitment resource:

  # CREATE
  match("/insert_commitment", { :controller => "commitments", :action => "create", :via => "post"})

  # READ
  match("/commitments", { :controller => "commitments", :action => "index", :via => "get"})

  match("/commitments/:route_commitment_id", { :controller => "commitments", :action => "show", :via => "get"})

  # UPDATE

  match("/modify_commitment/:route_commitment_id", { :controller => "commitments", :action => "update", :via => "post"})

  # DELETE
  match("/delete_commitment/:route_commitment_id", { :controller => "commitments", :action => "destroy", :via => "get"})

  #------------------------------

  # Routes for the Step resource:

  # CREATE
  match("/insert_step", { :controller => "steps", :action => "create", :via => "post"})

  # READ
  match("/steps", { :controller => "steps", :action => "index", :via => "get"})

  match("/steps/:route_step_id", { :controller => "steps", :action => "show", :via => "get"})

  # UPDATE

  match("/modify_step/:route_step_id", { :controller => "steps", :action => "update", :via => "post"})

  # DELETE
  match("/delete_step/:route_step_id", { :controller => "steps", :action => "destroy", :via => "get"})

  #------------------------------

  # Routes for the Vote resource:

  # CREATE
  match("/insert_vote", { :controller => "votes", :action => "create", :via => "post"})

  # READ
  match("/votes", { :controller => "votes", :action => "index", :via => "get"})

  match("/votes/:route_vote_id", { :controller => "votes", :action => "show", :via => "get"})

  # UPDATE

  match("/modify_vote/:route_vote_id", { :controller => "votes", :action => "update", :via => "post"})

  # DELETE
  match("/delete_vote/:route_vote_id", { :controller => "votes", :action => "destroy", :via => "get"})

  #------------------------------

  # Routes for the Comment resource:

  # CREATE
  match("/insert_comment", { :controller => "comments", :action => "create", :via => "post"})

  # READ
  match("/comments", { :controller => "comments", :action => "index", :via => "get"})

  match("/comments/:route_comment_id", { :controller => "comments", :action => "show", :via => "get"})

  # UPDATE

  match("/modify_comment/:route_comment_id", { :controller => "comments", :action => "update", :via => "post"})

  # DELETE
  match("/delete_comment/:route_comment_id", { :controller => "comments", :action => "destroy", :via => "get"})

  #------------------------------

  # Routes for the Proposal resource:

  # CREATE
  match("/insert_proposal", { :controller => "proposals", :action => "create", :via => "post"})

  # READ
  match("/proposals", { :controller => "proposals", :action => "index", :via => "get"})

  match("/proposals/:route_proposal_id", { :controller => "proposals", :action => "show", :via => "get"})

  # UPDATE

  match("/modify_proposal/:route_proposal_id", { :controller => "proposals", :action => "update", :via => "post"})

  # DELETE
  match("/delete_proposal/:route_proposal_id", { :controller => "proposals", :action => "destroy", :via => "get"})

  #------------------------------

  # Explore routes

  match("/", {
  		:controller => "application",
  		:action => "home",
  		:via => "get"
  			 }
  		)

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
