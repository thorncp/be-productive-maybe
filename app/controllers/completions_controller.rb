class CompletionsController < ApplicationController
  before_action :require_login

  def create
    task.completions.create!(completed_at: Time.current)
    flash[:success] = t("completions.success")
    redirect_to root_path
  end

  private

  def task
    current_user.tasks.find(params[:task_id])
  end
end
