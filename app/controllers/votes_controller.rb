class VotesController < LoginController
  def index
    @votes = Vote.all.order({ :created_at => :desc })

    respond_to do |format|
      format.json do
        render({ :json => @votes.as_json })
      end

      format.html do
        render({ :template => "votes/index.html.erb" })
      end
    end
  end

  def show
    the_id = params.fetch(:route_vote_id)
    @vote = Vote.where({:id => the_id }).first

    respond_to do |format|
      format.json do
        render({ :json => @vote.as_json })
      end

      format.html do
        render({ :template => "votes/show.html.erb" })
      end
    end
  end

  def create
    @vote = Vote.new

    @vote.proposal_id = params.fetch(:proposal_id, nil)
    @vote.user_id = params.fetch(:user_id, nil)

    if @vote.valid?
      @vote.save
      respond_to do |format|
        format.json do
          render({ :json => @vote.as_json })
        end

        format.html do
          redirect_to("/votes", { :notice => "Vote created successfully."})
        end
      end

    else
      respond_to do |format|
        format.json do
          render({ :json => @vote.as_json })
        end

        format.html do
          redirect_to("/votes", { :notice => "Vote failed to create successfully."})
        end
      end
    end
  end

  def update
    the_id = params.fetch(:route_vote_id)
    @vote = Vote.where(:id => the_id).at(0)


    @vote.proposal_id = params.fetch(:proposal_id, @vote.proposal_id)


    @vote.user_id = params.fetch(:user_id, @vote.user_id)


    if @vote.valid?
      @vote.save
      respond_to do |format|
        format.json do
          render({ :json => @vote.as_json })
        end

        format.html do
          redirect_to("/votes/#{@vote.id}", {:notice => "Vote updated successfully."})
        end
      end
    else
      # render({:template => "/votes/edit_form_with_errors.html.erb"})
      respond_to do |format|
        format.json do
          render({ :json => @vote.as_json })
        end

        format.html do
          render({ :template => "votes/show.html.erb" })
        end
      end
    end
  end

  def destroy
    the_id = params.fetch(:route_vote_id)
    @vote = Vote.where({ :id => the_id }).first

    @vote.destroy

    respond_to do |format|
      format.json do
        render({ :json => @vote.as_json })
      end

      format.html do
        redirect_to("/votes", {:notice => "Vote deleted successfully."})
      end
    end
  end
end
