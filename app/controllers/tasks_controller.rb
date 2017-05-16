class TasksController < ApplicationController
  before_action :require_login

  def index
    task = Task.new
    render locals: { task: task, tasks: current_user.tasks }
  end

  def create
    task = current_user.tasks.build(task_params)

    if task.save
      redirect_to tasks_path
    else
      render :index, locals: { task: task, tasks: current_user.tasks }
    end
  end

  def update
    task = current_user.tasks.find(params[:id])

    if task.update(task_params)
      flash[:success] = "Task updated"
      redirect_to tasks_path
    else
      render :index, locals: { task: task, tasks: current_user.tasks }
    end
  end

  private

  def task_params
    params.require(:task).permit(:description)
  end
end
