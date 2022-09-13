# frozen_string_literal: true

class Reports::CommentsController < CommentsController
  before_action :comment_params, only: %i[create]

  def create
    @report = Report.find(params[:report_id])
    @instance = @report

    save_and_redirect(@instance)
  end
end
