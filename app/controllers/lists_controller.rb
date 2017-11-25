class ListsController < ApplicationController
  before_action :current_user_must_be_list_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_list_user
    list = List.find(params[:id])

    unless current_user == list.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = List.ransack(params[:q])
    @lists = @q.result(:distinct => true).includes(:user, :tasks, :collaborators).page(params[:page]).per(10)

    render("lists/index.html.erb")
  end

  def show
    @collaborator = Collaborator.new
    @task = Task.new
    @list = List.find(params[:id])

    render("lists/show.html.erb")
  end

  def new
    @list = List.new

    render("lists/new.html.erb")
  end

  def create
    @list = List.new

    @list.listname = params[:listname]
    @list.listtype = params[:listtype]
    @list.listprioriti = params[:listprioriti]
    @list.listduedate = params[:listduedate]
    @list.liststatus = params[:liststatus]
    @list.user_id = params[:user_id]

    save_status = @list.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/lists/new", "/create_list"
        redirect_to("/lists")
      else
        redirect_back(:fallback_location => "/", :notice => "List created successfully.")
      end
    else
      render("lists/new.html.erb")
    end
  end

  def edit
    @list = List.find(params[:id])

    render("lists/edit.html.erb")
  end

  def update
    @list = List.find(params[:id])

    @list.listname = params[:listname]
    @list.listtype = params[:listtype]
    @list.listprioriti = params[:listprioriti]
    @list.listduedate = params[:listduedate]
    @list.liststatus = params[:liststatus]
    @list.user_id = params[:user_id]

    save_status = @list.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/lists/#{@list.id}/edit", "/update_list"
        redirect_to("/lists/#{@list.id}", :notice => "List updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "List updated successfully.")
      end
    else
      render("lists/edit.html.erb")
    end
  end

  def destroy
    @list = List.find(params[:id])

    @list.destroy

    if URI(request.referer).path == "/lists/#{@list.id}"
      redirect_to("/", :notice => "List deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "List deleted.")
    end
  end
end
