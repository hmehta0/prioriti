class CollaboratorsController < ApplicationController
  def index
    @collaborators = Collaborator.page(params[:page]).per(10)

    render("collaborators/index.html.erb")
  end

  def show
    @collaborator = Collaborator.find(params[:id])

    render("collaborators/show.html.erb")
  end

  def new
    @collaborator = Collaborator.new

    render("collaborators/new.html.erb")
  end

  def create
    @collaborator = Collaborator.new

    @collaborator.list_id = params[:list_id]

    save_status = @collaborator.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/collaborators/new", "/create_collaborator"
        redirect_to("/collaborators")
      else
        redirect_back(:fallback_location => "/", :notice => "Collaborator created successfully.")
      end
    else
      render("collaborators/new.html.erb")
    end
  end

  def edit
    @collaborator = Collaborator.find(params[:id])

    render("collaborators/edit.html.erb")
  end

  def update
    @collaborator = Collaborator.find(params[:id])

    @collaborator.list_id = params[:list_id]

    save_status = @collaborator.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/collaborators/#{@collaborator.id}/edit", "/update_collaborator"
        redirect_to("/collaborators/#{@collaborator.id}", :notice => "Collaborator updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Collaborator updated successfully.")
      end
    else
      render("collaborators/edit.html.erb")
    end
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])

    @collaborator.destroy

    if URI(request.referer).path == "/collaborators/#{@collaborator.id}"
      redirect_to("/", :notice => "Collaborator deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Collaborator deleted.")
    end
  end
end
