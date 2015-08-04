class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    build_comment
    save_comment or render 'new'
  end

  private

    def comment_params
      params.require(:comment).permit(:body) # no need to set params for commentable since it's already set
    end

    def build_comment
      @comment = @commentable.comments.build comment_params
      @comment.user = current_user
    end

    def save_comment
      @comment.save
      redirect_to @commentable
    end
end
