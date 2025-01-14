class ProposalsPrivateController < ProposalsController

  before_action :check_auth

  def form
    render({ :template => "proposals/new.html.erb" })
  end

  def edit_form
    @proposal = Proposal.where(:id => params.fetch(:route_proposal_id)).first
    render({ :template => "proposals/edit.html.erb" })
  end

  def create
    @proposal = Proposal.new

    @proposal.name = params.fetch(:name, nil)
    @proposal.description = params.fetch(:description, nil)
    @proposal.status = params.fetch(:status, nil)
    @proposal.owned_by_user_id = params.fetch(:owned_by_user_id, nil)
    @proposal.state = params.fetch(:state, nil)
    @proposal.zipcode = params.fetch(:zipcode, nil)
    @proposal.city = params.fetch(:city, nil)

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


    @proposal.owner_id = params.fetch(:owner_id, @proposal.owner_id)


    @proposal.state = params.fetch(:state, @proposal.state)


    @proposal.zipcode = params.fetch(:zipcode, @proposal.zipcode)

    @proposal.city = params.fetch(:zipcode, @proposal.city)



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
