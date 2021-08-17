class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit ]
 
  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task, notice: "タスクを追加しました"
    else
      render :new
    end
  end  

  def edit
  end

  private
  def set_task
    @task =Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :content)
  end

end
