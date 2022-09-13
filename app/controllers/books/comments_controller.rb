# frozen_string_literal: true

class Books::CommentsController < CommentsController
  before_action :comment_params, only: %i[create]

  def create
    @book = Book.find(params[:book_id])
    @instance = @book

    save_and_redirect(@instance)
  end
end
