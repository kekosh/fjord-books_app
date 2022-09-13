# frozen_string_literal: true

class CommentsController < ApplicationController
  private

  def save_and_redirect(instance)
    @comment = instance.comments.new(comment_params)
    @comment.save!
    redirect_to instance, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end
end
