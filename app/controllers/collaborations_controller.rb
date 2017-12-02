class CollaborationsController < ApplicationController
  def index
    @q = Collaboration.ransack(params[:q])
    @collaborations = @q.result(:distinct => true).includes(:user, :list).page(params[:page]).per(10)

    render("collaborations/index.html.erb")
  end

  def show
    @collaboration = Collaboration.find(params[:id])

    render("collaborations/show.html.erb")
  end

  def new
    @collaboration = Collaboration.new

    render("collaborations/new.html.erb")
  end

  def create
    @collaboration = Collaboration.new

    @collaboration.list_id = params[:list_id]
    @collaboration.user_id = params[:user_id]

    save_status = @collaboration.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/collaborations/new", "/create_collaboration"
        redirect_to("/collaborations")
      else
        redirect_back(:fallback_location => "/", :notice => "Collaboration created successfully.")
      end
    else
      render("collaborations/new.html.erb")
    end
  end

  def edit
    @collaboration = Collaboration.find(params[:id])

    render("collaborations/edit.html.erb")
  end

  def update
    @collaboration = Collaboration.find(params[:id])

    @collaboration.list_id = params[:list_id]
    @collaboration.user_id = params[:user_id]

    save_status = @collaboration.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/collaborations/#{@collaboration.id}/edit", "/update_collaboration"
        redirect_to("/collaborations/#{@collaboration.id}", :notice => "Collaboration updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Collaboration updated successfully.")
      end
    else
      render("collaborations/edit.html.erb")
    end
  end

  def destroy
    @collaboration = Collaboration.find(params[:id])

    @collaboration.destroy

    if URI(request.referer).path == "/collaborations/#{@collaboration.id}"
      redirect_to("/", :notice => "Collaboration deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Collaboration deleted.")
    end
  end
end
