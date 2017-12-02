class SubtasksController < ApplicationController
  def index
    @q = Subtask.ransack(params[:q])
    @subtasks = @q.result(:distinct => true).includes(:task).page(params[:page]).per(10)

    render("subtasks/index.html.erb")
  end

  def show
    @subtask = Subtask.find(params[:id])

    render("subtasks/show.html.erb")
  end

  def new
    @subtask = Subtask.new

    render("subtasks/new.html.erb")
  end

  def create
    @subtask = Subtask.new

    @subtask.name = params[:name]
    @subtask.prioriti = params[:prioriti]
    @subtask.duedate = params[:duedate]
    @subtask.status = params[:status]
    @subtask.task_id = params[:task_id]

    save_status = @subtask.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/subtasks/new", "/create_subtask"
        redirect_to("/subtasks")
      else
        redirect_back(:fallback_location => "/", :notice => "Subtask created successfully.")
      end
    else
      render("subtasks/new.html.erb")
    end
  end

  def edit
    @subtask = Subtask.find(params[:id])

    render("subtasks/edit.html.erb")
  end

  def update
    @subtask = Subtask.find(params[:id])

    @subtask.name = params[:name]
    @subtask.prioriti = params[:prioriti]
    @subtask.duedate = params[:duedate]
    @subtask.status = params[:status]
    @subtask.task_id = params[:task_id]

    save_status = @subtask.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/subtasks/#{@subtask.id}/edit", "/update_subtask"
        redirect_to("/subtasks/#{@subtask.id}", :notice => "Subtask updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Subtask updated successfully.")
      end
    else
      render("subtasks/edit.html.erb")
    end
  end

  def destroy
    @subtask = Subtask.find(params[:id])

    @subtask.destroy

    if URI(request.referer).path == "/subtasks/#{@subtask.id}"
      redirect_to("/", :notice => "Subtask deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Subtask deleted.")
    end
  end
end
