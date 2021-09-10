class CommentsController < ApplicationController
  def create
    @comment = @commentable.comments.build(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @commentable, notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @commentable }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @commentable.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :commentable_id, :commentable_type).merge(user_id: current_user.id)
    end
end
