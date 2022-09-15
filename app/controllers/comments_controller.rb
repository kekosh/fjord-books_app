# frozen_string_literal: true

class CommentsController < ApplicationController
  private

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.save!
    redirect_to @commentable, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end
end
