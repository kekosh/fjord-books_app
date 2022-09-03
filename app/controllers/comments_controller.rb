# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :comment_params, only: %i[create]

  def create
    @report = Report.find(params[:report_id])
    @comment = @report.comments.new(comment_params)
    @comment.save
    redirect_to report_path(params[:report_id])
  end
end

private

def comment_params
  params.require(:comment).permit(:content, :user_id)
end
