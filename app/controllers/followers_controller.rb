class FollowersController < LoginController

  def follow
    user = User.where(:id => params.fetch(:route_user_id)).first
    @proposal = Proposal.where(:id => params.fetch(:route_proposal_id)).first
    f = Follower.new
    f.user_id = user.id
    f.proposal_id = @proposal.id
    save_status = f.save
    if save_status == true
      redirect_to("/proposals/#{@proposal.id}", { :notice => "You now follow this proposal!" })
    else
      redirect_to("/proposals/#{@proposal.id}", { :alert => "Error following proposal." })
    end
  end

  def unfollow
    @proposal = Proposal.where(:id => params.fetch(:route_proposal_id,nil)).first
    follows = Follower.where(:user_id => params.fetch(:route_user_id,nil))
    this_follow = follows.where(:proposal_id => @proposal.id).first
    this_follow.destroy
    unless Follower.where(:id => this_follow.id).exists?
      redirect_to("/proposals/#{@proposal.id}", { :notice => "You no longer follow this proposal." })
    end
  end

end
