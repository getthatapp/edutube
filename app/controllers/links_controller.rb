class LinksController < ApplicationController

  def index
    @links = Link.all.order(created_at: :DESC)
  end

  def new
    @link - Link.new
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      redirect_to root_path, success: "Link created!"
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
    if link_update(link_params)
      redirect_to link_path(link), info: "Link updated!"
    else
      render 'edit'
    end
  end

  def destroy

  end

  private

  def link_params
    params.require(:link).permit(:title, :link)
  end

  def link
    @link = Link.find(params[:id])
  end

end