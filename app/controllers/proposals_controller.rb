class ProposalsController < ApplicationController
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
    @proposal.location = params.fetch(:location, nil)
    @proposal.status = params.fetch(:status, nil)
    @proposal.owned_by_user_id = params.fetch(:owned_by_user_id, nil)

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


    @proposal.location = params.fetch(:location, @proposal.location)


    @proposal.status = params.fetch(:status, @proposal.status)


    @proposal.owned_by_user_id = params.fetch(:owned_by_user_id, @proposal.owned_by_user_id)


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
