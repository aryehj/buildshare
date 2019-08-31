class ProposalsController < LoginController
  def index
    @proposals = Proposal.all.order({ :created_at => :desc })

    respond_to do |format|
      format.json do
        render({ :json => @proposals.as_json })
      end

      format.html do
        render({ :template => "proposals/index.html.erb" })
      end
    end
  end

  def form
    render({ :template => "proposals/new.html.erb" })
  end

  def show
    the_id = params.fetch(:route_proposal_id)
    @proposal = Proposal.where({:id => the_id }).first

    respond_to do |format|
      format.json do
        render({ :json => @proposal.as_json })
      end

      format.html do
        render({ :template => "proposals/show.html.erb" })
      end
    end
  end

  def create
    @proposal = Proposal.new

    @proposal.name = params.fetch(:name, nil)
    @proposal.description = params.fetch(:description, nil)
    @proposal.status = params.fetch(:status, nil)
    @proposal.owned_by_user_id = params.fetch(:owned_by_user_id, nil)
    @proposal.state = params.fetch(:state, nil)
    @proposal.zipcode = params.fetch(:zipcode, nil)

    if @proposal.valid?
      @proposal.save
      respond_to do |format|
        format.json do
          render({ :json => @proposal.as_json })
        end

        format.html do
          redirect_to("/proposals", { :notice => "Proposal created successfully."})
        end
      end

    else
      respond_to do |format|
        format.json do
          render({ :json => @proposal.as_json })
        end

        format.html do
          redirect_to("/proposals", { :notice => "Proposal failed to create successfully."})
        end
      end
    end
  end

  def update
    the_id = params.fetch(:route_proposal_id)
    @proposal = Proposal.where(:id => the_id).at(0)


    @proposal.name = params.fetch(:name, @proposal.name)


    @proposal.description = params.fetch(:description, @proposal.description)


    @proposal.status = params.fetch(:status, @proposal.status)


    @proposal.owned_by_user_id = params.fetch(:owned_by_user_id, @proposal.owned_by_user_id)


    @proposal.state = params.fetch(:state, @proposal.state)


    @proposal.zipcode = params.fetch(:zipcode, @proposal.zipcode)


    if @proposal.valid?
      @proposal.save
      respond_to do |format|
        format.json do
          render({ :json => @proposal.as_json })
        end

        format.html do
          redirect_to("/proposals/#{@proposal.id}", {:notice => "Proposal updated successfully."})
        end
      end
    else
      # render({:template => "/proposals/edit_form_with_errors.html.erb"})
      respond_to do |format|
        format.json do
          render({ :json => @proposal.as_json })
        end

        format.html do
          render({ :template => "proposals/show.html.erb" })
        end
      end
    end
  end

  def near_me
    render({ :template => "proposals/near_me.html.erb" })
  end

  def destroy
    the_id = params.fetch(:route_proposal_id)
    @proposal = Proposal.where({ :id => the_id }).first

    @proposal.destroy

    respond_to do |format|
      format.json do
        render({ :json => @proposal.as_json })
      end

      format.html do
        redirect_to("/proposals", {:notice => "Proposal deleted successfully."})
      end
    end
  end
end
