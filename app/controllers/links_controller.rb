class LinksController < ApplicationController
  def index
    if params[:tag]
        @links = Links.all.tagged_with(params[:tag]).order(created_at: :DESC)
      else
        @links = Link.all.order(created_at: :DESC)
    end
  end

  def new
    @link = Link.new
  end

  def create
    @link = current_user.links.build(link_params)
    if @link.save
      flash[:success] = "Link created!"
      redirect_to links_path
    else
      render 'new'
    end
  end

  def show
    link
  end

  def edit
    link
  end

  def update
    if link.update(link_params)
      flash[:info] = "Link updated!"
      redirect_to links_path
    else
      render 'edit'
    end
  end

  def destroy
    link.destroy
    flash[:danger] = "Link deleted!"
    redirect_to links_path
  end

  private

  def link_params
    params.require(:link).permit(:title, :link, :tag_list)
  end

  def link
    @link ||= Link.find(params[:id])
  end
end
