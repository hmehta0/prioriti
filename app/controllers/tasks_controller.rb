class TasksController < ApplicationController
  def index
    @tasks = Task.all

    render("tasks/index.html.erb")
  end

  def show
    @subtask = Subtask.new
    @task = Task.find(params[:id])

    render("tasks/show.html.erb")
  end

  def new
    @task = Task.new

    render("tasks/new.html.erb")
  end

  def create
    @task = Task.new

    @task.taskname = params[:taskname]
    @task.taskprioriti = params[:taskprioriti]
    @task.taskduedate = params[:taskduedate]
    @task.taskstatus = params[:taskstatus]
    @task.list_id = params[:list_id]

    save_status = @task.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/tasks/new", "/create_task"
        redirect_to("/tasks")
      else
        redirect_back(:fallback_location => "/", :notice => "Task created successfully.")
      end
    else
      render("tasks/new.html.erb")
    end
  end

  def edit
    @task = Task.find(params[:id])

    render("tasks/edit.html.erb")
  end

  def update
    @task = Task.find(params[:id])

    @task.taskname = params[:taskname]
    @task.taskprioriti = params[:taskprioriti]
    @task.taskduedate = params[:taskduedate]
    @task.taskstatus = params[:taskstatus]
    @task.list_id = params[:list_id]

    save_status = @task.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/tasks/#{@task.id}/edit", "/update_task"
        redirect_to("/tasks/#{@task.id}", :notice => "Task updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Task updated successfully.")
      end
    else
      render("tasks/edit.html.erb")
    end
  end

  def destroy
    @task = Task.find(params[:id])

    @task.destroy

    if URI(request.referer).path == "/tasks/#{@task.id}"
      redirect_to("/", :notice => "Task deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Task deleted.")
    end
  end
end
