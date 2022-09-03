# frozen_string_literal: true

class Reports::CommentsController < ApplicationController
  before_action :comment_params, only: %i[create]

  def create
    @report = Report.find(params[:report_id])
    @comment = @report.comments.new(comment_params)
    @comment.save
    redirect_to report_path(params[:report_id]), notice: t('controllers.common.notice_create', name: Comment.model_name.human)
  end
end

private

def comment_params
  params.require(:comment).permit(:content, :user_id)
end
