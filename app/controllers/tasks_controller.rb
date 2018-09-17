TASKS = [
  { task: "yawning", person: "Margot Lee Shetterly"},
  { task: "eating", person: "Sandi Metz"},
  { task: "sleeping", person: "Octavia E. Butler"}
]

class TasksController < ApplicationController
  def index
    @tasks = TASKS
  end

  def show
    task_id = params[:id]
    @task = TASKS[task_id]
  end
end
