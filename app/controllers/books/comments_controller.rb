# frozen_string_literal: true

class Books::CommentsController < ApplicationController
  before_action :comment_params, only: %i[create]

  def create
    @book = Book.find(params[:book_id])
    @comment = @book.comments.new(comment_params)
    @comment.save
    redirect_to book_path(params[:book_id]) ,notice: t('controllers.common.notice_create', name: Comment.model_name.human)
  end
end

private

def comment_params
  params.require(:comment).permit(:content, :user_id)
end
