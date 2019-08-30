class StakeholdersController < LoggenInController
  def index
    @stakeholders = Stakeholder.all.order({ :created_at => :desc })

    respond_to do |format|
      format.json do
        render({ :json => @stakeholders.as_json })
      end

      format.html do
        render({ :template => "stakeholders/index.html.erb" })
      end
    end
  end

  def show
    the_id = params.fetch(:route_stakeholder_id)
    @stakeholder = Stakeholder.where({:id => the_id }).first

    respond_to do |format|
      format.json do
        render({ :json => @stakeholder.as_json })
      end

      format.html do
        render({ :template => "stakeholders/show.html.erb" })
      end
    end
  end

  def create
    @stakeholder = Stakeholder.new

    @stakeholder.name = params.fetch(:name, nil)
    @stakeholder.email = params.fetch(:email, nil)
    @stakeholder.phone = params.fetch(:phone, nil)
    @stakeholder.address = params.fetch(:address, nil)
    @stakeholder.created_by_user_id = params.fetch(:created_by_user_id, nil)
    @stakeholder.proposal_id = params.fetch(:proposal_id, nil)
    @stakeholder.step_id = params.fetch(:step_id, nil)
    @stakeholder.user_id = params.fetch(:user_id, nil)

    if @stakeholder.valid?
      @stakeholder.save
      respond_to do |format|
        format.json do
          render({ :json => @stakeholder.as_json })
        end

        format.html do
          redirect_to("/stakeholders", { :notice => "Stakeholder created successfully."})
        end
      end

    else
      respond_to do |format|
        format.json do
          render({ :json => @stakeholder.as_json })
        end

        format.html do
          redirect_to("/stakeholders", { :notice => "Stakeholder failed to create successfully."})
        end
      end
    end
  end

  def update
    the_id = params.fetch(:route_stakeholder_id)
    @stakeholder = Stakeholder.where(:id => the_id).at(0)


    @stakeholder.name = params.fetch(:name, @stakeholder.name)


    @stakeholder.email = params.fetch(:email, @stakeholder.email)


    @stakeholder.phone = params.fetch(:phone, @stakeholder.phone)


    @stakeholder.address = params.fetch(:address, @stakeholder.address)


    @stakeholder.created_by_user_id = params.fetch(:created_by_user_id, @stakeholder.created_by_user_id)


    @stakeholder.proposal_id = params.fetch(:proposal_id, @stakeholder.proposal_id)


    @stakeholder.step_id = params.fetch(:step_id, @stakeholder.step_id)


    @stakeholder.user_id = params.fetch(:user_id, @stakeholder.user_id)


    if @stakeholder.valid?
      @stakeholder.save
      respond_to do |format|
        format.json do
          render({ :json => @stakeholder.as_json })
        end

        format.html do
          redirect_to("/stakeholders/#{@stakeholder.id}", {:notice => "Stakeholder updated successfully."})
        end
      end
    else
      # render({:template => "/stakeholders/edit_form_with_errors.html.erb"})
      respond_to do |format|
        format.json do
          render({ :json => @stakeholder.as_json })
        end

        format.html do
          render({ :template => "stakeholders/show.html.erb" })
        end
      end
    end
  end

  def destroy
    the_id = params.fetch(:route_stakeholder_id)
    @stakeholder = Stakeholder.where({ :id => the_id }).first

    @stakeholder.destroy

    respond_to do |format|
      format.json do
        render({ :json => @stakeholder.as_json })
      end

      format.html do
        redirect_to("/stakeholders", {:notice => "Stakeholder deleted successfully."})
      end
    end
  end
end
