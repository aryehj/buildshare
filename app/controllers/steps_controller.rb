class StepsController < LoginController
  def index
    @steps = Step.all.order({ :created_at => :desc })

    respond_to do |format|
      format.json do
        render({ :json => @steps.as_json })
      end

      format.html do
        render({ :template => "steps/index.html.erb" })
      end
    end
  end

  def show
    the_id = params.fetch(:route_step_id)
    @step = Step.where({:id => the_id }).first

    respond_to do |format|
      format.json do
        render({ :json => @step.as_json })
      end

      format.html do
        render({ :template => "steps/show.html.erb" })
      end
    end
  end

  def done
    the_step = Step.where(:id => params.fetch(:route_step_id)).first
    the_step.status = "done"
    save_status = the_step.save
    if save_status == true
      redirect_to("/proposals/#{the_step.proposal_id}", { :notice => "Step marked as done!" })
    else
      redirect_to("/proposals/#{the_step.proposal_id}", { :alert => "Something went wrong." })
    end
  end

  def claim
    the_step = Step.where(:id => params.fetch(:route_step_id)).first
    the_step.volunteer_id = params.fetch(:form_volunteer_id)
    the_step.status = "assigned"
    save_status = the_step.save
    if save_status == true
      redirect_to("/proposals/#{the_step.proposal_id}", { :notice => "Thanks for volunteering!" })
    else
      redirect_to("/proposals/#{the_step.proposal_id}", { :alert => "Something went wrong." })
    end
  end

  def add_step_form
    render({ :template => "steps/add_step.html.erb" })
  end


  def create
    @step = Step.new

    @step.proposal_id = params.fetch(:form_proposal_id, nil)
    @step.name = params.fetch(:form_name, nil)
    @step.status = "unassigned"
    @step.volunteer_id = params.fetch(:form_volunteer_id, nil)

    if @step.valid?
      @step.save
      respond_to do |format|
        format.json do
          render({ :json => @step.as_json })
        end

        format.html do
          @proposal = Proposal.where(:id => @step.proposal_id).first
          redirect_to("/proposals/#{@step.proposal_id}", { :notice => "Step created."})
        end
      end

    else
      respond_to do |format|
        format.json do
          render({ :json => @step.as_json })
        end

        format.html do
          redirect_to("/steps", { :notice => "Step failed to create successfully."})
        end
      end
    end
  end

  def update
    the_id = params.fetch(:route_step_id)
    @step = Step.where(:id => the_id).at(0)


    @step.proposal_id = params.fetch(:proposal_id, @step.proposal_id)


    @step.name = params.fetch(:name, @step.name)


    @step.status = params.fetch(:status, @step.status)


    if @step.valid?
      @step.save
      respond_to do |format|
        format.json do
          render({ :json => @step.as_json })
        end

        format.html do
          redirect_to("/steps/#{@step.id}", {:notice => "Step updated successfully."})
        end
      end
    else
      # render({:template => "/steps/edit_form_with_errors.html.erb"})
      respond_to do |format|
        format.json do
          render({ :json => @step.as_json })
        end

        format.html do
          render({ :template => "steps/show.html.erb" })
        end
      end
    end
  end

  def destroy
    the_id = params.fetch(:route_step_id)
    @step = Step.where({ :id => the_id }).first

    @step.destroy

    respond_to do |format|
      format.json do
        render({ :json => @step.as_json })
      end

      format.html do
        redirect_to("/steps", {:notice => "Step deleted successfully."})
      end
    end
  end
end
