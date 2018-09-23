class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    task_id = params[:id]
    @task = Task.find_by(id: task_id)
    if @task.nil?
      head :not_found
    end
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new(
      action: params[:task][:action],
      description: params[:task][:description],
      completion_date: params[:task][:completion_date]
    )

    is_successful_save = task.save

    if is_successful_save
      redirect_to tasks_path
    else
      render :new
    end
  end

  def edit
    task_id = params[:id]
    @task = Task.find_by(id: task_id)
  end

  def update
    task_id = params[:id]
    @task = Task.find_by(id: task_id)
    @task.update(
      action: params[:task][:action],
      description: params[:task][:description],
      completion_date: params[:task][:completion_date]
    )

    redirect_to task_path(@task.id)
  end

  def destroy
    task_id = params[:id]
    @task = Task.find_by(id: task_id)

    @task.destroy
    redirect_to tasks_path
  end

  def complete
    task_id = params[:id]
    @task = Task.find_by(id: task_id)
    @task.update(completion_date: DateTime.now.strftime("%Y-%m-%d"))

    redirect_to tasks_path
  end
end
