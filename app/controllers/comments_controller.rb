class CommentsController < LoginController
  def index
    @comments = Comment.all.order({ :created_at => :desc })

    respond_to do |format|
      format.json do
        render({ :json => @comments.as_json })
      end

      format.html do
        render({ :template => "comments/index.html.erb" })
      end
    end
  end

  def show
    the_id = params.fetch(:route_comment_id)
    @comment = Comment.where({:id => the_id }).first

    respond_to do |format|
      format.json do
        render({ :json => @comment.as_json })
      end

      format.html do
        @comment = Comment.where(:id => params.fetch(:route_comment_id)).first
        render({ :template => "comments/edit.html.erb" })
      end
    end
  end

  def create
    @comment = Comment.new

    @comment.comment = params.fetch(:comment, nil)
    @comment.user_id = params.fetch(:user_id, nil)
    @comment.proposal_id = params.fetch(:proposal_id, nil)

    if @comment.valid?
      @comment.save
      respond_to do |format|
        format.json do
          render({ :json => @comment.as_json })
        end

        format.html do
          redirect_to("/proposals/#{@comment.proposal_id}", { :notice => "Comment created."})
        end
      end

    else
      respond_to do |format|
        format.json do
          render({ :json => @comment.as_json })
        end

        format.html do
          redirect_to("/proposals/#{@comment.proposal_id}", { :alert => "Unable to create comment."})
        end
      end
    end
  end

  def comment_form
    @proposal = Proposal.where(:id => params.fetch(:route_proposal_id)).first
    render({ :template => "comments/create.html.erb" })
  end

  def update
    the_id = params.fetch(:route_comment_id)
    @comment = Comment.where(:id => the_id).at(0)


    @comment.comment = params.fetch(:comment, @comment.comment)


    @comment.user_id = params.fetch(:user_id, @comment.user_id)


    @comment.proposal_id = params.fetch(:proposal_id, @comment.proposal_id)


    if @comment.valid?
      @comment.save
      respond_to do |format|
        format.json do
          render({ :json => @comment.as_json })
        end

        format.html do
          redirect_to("/proposals/#{@comment.proposal_id}", {:notice => "Comment updated."})
        end
      end
    else
      # render({:template => "/comments/edit_form_with_errors.html.erb"})
      respond_to do |format|
        format.json do
          render({ :json => @comment.as_json })
        end

        format.html do
          render({ :template => "comments/show.html.erb" })
        end
      end
    end
  end

  def destroy
    the_id = params.fetch(:route_comment_id)
    @comment = Comment.where({ :id => the_id }).first

    @comment.destroy

    respond_to do |format|
      format.json do
        render({ :json => @comment.as_json })
      end

      format.html do
        redirect_to("/proposals/#{@comment.proposal_id}", {:notice => "Comment deleted."})
      end
    end
  end
end
