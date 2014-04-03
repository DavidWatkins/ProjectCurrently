class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  
  #def index
  #  @comments = Comment.all
  #end
  
  def show
  end

  def new
    @comment = Comment.new
    @form_action = project_path(@project)
    @new = true
  end
 
  def edit
    @form_action = project_path(@project, @comment)
    @new = false
  end
  
  def create
    @project = Project.find(params[:comment][:project_id])
    @comment = @project.comments.new({:content => params[:comment][:content]})
    if @comment.save
      redirect_to @project, notice: "Comment created."
    else
      redirect_to @project, notice: "Comment not created."
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content)
    end
end
