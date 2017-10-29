class LinksController < ApplicationController
  before_action :authenticate_user!

  def index
    @links = current_user.links.order(created_at: :DESC)
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
    params.require(:link).permit(:title, :link)
  end

  def link
    @link ||= Link.find(params[:id])
  end
end
