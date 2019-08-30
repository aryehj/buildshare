class CommitmentsController < LoginController
  def index
    @commitments = Commitment.all.order({ :created_at => :desc })

    respond_to do |format|
      format.json do
        render({ :json => @commitments.as_json })
      end

      format.html do
        render({ :template => "commitments/index.html.erb" })
      end
    end
  end

  def show
    the_id = params.fetch(:route_commitment_id)
    @commitment = Commitment.where({:id => the_id }).first

    respond_to do |format|
      format.json do
        render({ :json => @commitment.as_json })
      end

      format.html do
        render({ :template => "commitments/show.html.erb" })
      end
    end
  end

  def create
    @commitment = Commitment.new

    @commitment.proposal_id = params.fetch(:proposal_id, nil)
    @commitment.step_id = params.fetch(:step_id, nil)
    @commitment.user_id = params.fetch(:user_id, nil)

    if @commitment.valid?
      @commitment.save
      respond_to do |format|
        format.json do
          render({ :json => @commitment.as_json })
        end

        format.html do
          redirect_to("/commitments", { :notice => "Commitment created successfully."})
        end
      end

    else
      respond_to do |format|
        format.json do
          render({ :json => @commitment.as_json })
        end

        format.html do
          redirect_to("/commitments", { :notice => "Commitment failed to create successfully."})
        end
      end
    end
  end

  def update
    the_id = params.fetch(:route_commitment_id)
    @commitment = Commitment.where(:id => the_id).at(0)


    @commitment.proposal_id = params.fetch(:proposal_id, @commitment.proposal_id)


    @commitment.step_id = params.fetch(:step_id, @commitment.step_id)


    @commitment.user_id = params.fetch(:user_id, @commitment.user_id)


    if @commitment.valid?
      @commitment.save
      respond_to do |format|
        format.json do
          render({ :json => @commitment.as_json })
        end

        format.html do
          redirect_to("/commitments/#{@commitment.id}", {:notice => "Commitment updated successfully."})
        end
      end
    else
      # render({:template => "/commitments/edit_form_with_errors.html.erb"})
      respond_to do |format|
        format.json do
          render({ :json => @commitment.as_json })
        end

        format.html do
          render({ :template => "commitments/show.html.erb" })
        end
      end
    end
  end

  def destroy
    the_id = params.fetch(:route_commitment_id)
    @commitment = Commitment.where({ :id => the_id }).first

    @commitment.destroy

    respond_to do |format|
      format.json do
        render({ :json => @commitment.as_json })
      end

      format.html do
        redirect_to("/commitments", {:notice => "Commitment deleted successfully."})
      end
    end
  end
end
