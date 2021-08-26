class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]
 
  def index
    if params[:sort_expired]  
      @tasks = Task.all.order(end_date: "DESC").page(params[:page]).per(10)
    elsif params[:sort_priority]  
      @tasks = Task.all.order(priority: "ASC").page(params[:page]).per(10)
    elsif
      @tasks = Task.all.order(created_at: "DESC").page(params[:page]).per(10)
    end

  
      if params[:title].present? && params[:status].present?
        @tasks = Task.search_title(params[:title]).search_status(params[:status]).page(params[:page]).per(10)
      elsif params[:title].present?
        @tasks = Task.search_title(params[:title]).page(params[:page]).per(10)
      elsif params[:status].present?
        @tasks = Task.search_status(params[:status]).page(params[:page]).per(10)
      end
  
  end


  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if params[:back]
      render :new
    elsif @task.save
      redirect_to @task, notice: "タスクを追加しました"
    else
      render :new
    end
  end  

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: "編集しました"
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: "投稿を削除しました"
  end

  def confirm
    @task = Task.new(task_params)
    render :new if @task.invalid?
  end


  private
  def set_task
    @task =Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(
      :title, 
      :content, 
      :end_date, 
      :priority,
      :status
    )
  end
end