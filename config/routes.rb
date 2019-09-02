Rails.application.routes.draw do


  # follower routes
 match("/follow/:route_proposal_id/:route_user_id",
   {
      :controller => "followers",
      :action => "follow",
      :via => "get"
   }
  )

  match("/unfollow/:route_proposal_id/:route_user_id",
    {
       :controller => "followers",
       :action => "unfollow",
       :via => "get"
    }
   )

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

  match("/authenticate",
    {
      :controller => "users",
      :action => "authenticate",
      :via => "post"
    }
  )

  # Routes for the Stakeholder resource:

  # CREATE
  # match("/insert_stakeholder", { :controller => "stakeholders", :action => "create", :via => "post"})

  # READ
  # match("/stakeholders", { :controller => "stakeholders", :action => "index", :via => "get"})

  # match("/stakeholders/:route_stakeholder_id", { :controller => "stakeholders", :action => "show", :via => "get"})

  # UPDATE

  # match("/modify_stakeholder/:route_stakeholder_id", { :controller => "stakeholders", :action => "update", :via => "post"})

  # DELETE
  # match("/delete_stakeholder/:route_stakeholder_id", { :controller => "stakeholders", :action => "destroy", :via => "get"})

  #------------------------------


  # Routes for the Step resource:

  # CREATE
  match("/insert_step", { :controller => "steps", :action => "create", :via => "post"})

  match("/proposals/add_step/:route_proposal_id", { :controller => "steps", :action => "add_step_form", :via => "get" })

  # READ
  match("/steps", { :controller => "steps", :action => "index", :via => "get"})

  match("/steps/:route_step_id", { :controller => "steps", :action => "show", :via => "get"})

  # UPDATE

  match("/modify_step/:route_step_id", { :controller => "steps", :action => "update", :via => "post"})
  match("/step/:route_step_id/claim", { :controller => "steps", :action => "claim", :via => "post" })
  match("/step/:route_step_id/done", { :controller => "steps", :action => "done", :via => "post" })

  # DELETE
  match("/delete_step/:route_step_id", { :controller => "steps", :action => "destroy", :via => "get"})

  #------------------------------


  # Routes for the Comment resource:

  # CREATE
  match("/insert_comment", { :controller => "comments", :action => "create", :via => "post"})

  match("/proposals/:route_proposal_id/comment", { :controller => "comments", :action => "comment_form", :via => "get" })

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
  match("/proposals/new",
      {
        :controller => "proposals_private",
        :action => "form",
        :via => "get"
      }
    )
  match("proposals/edit/:route_proposal_id",
      {
        :controller => "proposals_private",
        :action => "edit_form",
        :via => "get"
      }
    )

  # READ
  match("/proposals", { :controller => "proposals", :action => "index", :via => "get"})

  match("/proposals/near_me", { :controller => "proposals", :action => "near_me", via: "get"})

  match("/proposals/:route_proposal_id", { :controller => "proposals", :action => "show", :via => "get"})

  # UPDATE

  match("/modify_proposal/:route_proposal_id", { :controller => "proposals_private", :action => "update", :via => "post"})

  # DELETE
  match("/delete_proposal/:route_proposal_id", { :controller => "proposals_private", :action => "destroy", :via => "get"})

  #------------------------------

  # Explore routes

  match("/", {
  		:controller => "application",
  		:action => "explore",
  		:via => "get"
  			 }
  		)

  match("/home", {
    :controller => "users",
    :action => "home",
    :via => "get"
        }
      )

  ActiveAdmin.routes(self)
end
