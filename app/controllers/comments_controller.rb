# frozen_string_literal: true

class CommentsController < ApplicationController
  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end
end
