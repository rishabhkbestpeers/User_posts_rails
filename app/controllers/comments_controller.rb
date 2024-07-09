class CommentsController < ApplicationController
  def new
    @comment = Comment.new()
  end
  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id].to_i
    if @comment.save
      redirect_to post_path(params[:post_id].to_i), notice: "New Comment added"
    else
      render :new, alert: "something went wrong"
    end
  end
  def edit
    @comment = Comment.find(params[:id])
  end
  def update

    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to post_path(params[:post_id])
    else
      flash[:alert] = "Comment in not edited"
      redirect_to edit_post_comment_path
    end
  end
  def destroy
    @comment = Comment.find(params[:post_id])
    @comment.destroy
    redirect_to post_path(params[:id])

  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
