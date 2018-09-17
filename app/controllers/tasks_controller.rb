TASKS = [
  { task: "yawning", person: "Margot Lee Shetterly"},
  { task: "eating", person: "Sandi Metz"},
  { task: "sleeping", person: "Octavia E. Butler"}
]

class TasksController < ApplicationController
  def index
    @tasks = TASKS
  end

  def show(id)
    @task = TASKS[]
  end
end
