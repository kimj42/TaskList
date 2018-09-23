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
    filtered_task_params = task_params()
    task = Task.new(filtered_task_params)


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
    @task.update(task_params)

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

  private

  def task_params
    return params.require(:task).permit(
      :action,
      :description,
      :completion_date
    )
  end
end
