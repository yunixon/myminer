class RigsController < ApplicationController

  load_and_authorize_resource param_method: :rig_params
  before_action :set_rig, only: [:show, :edit, :update]

  def index
    @search = Rig.published.search(params[:q])
    @rigs = @search.result.order(:name).page(params[:page])
  end

  def new
    @rig = Rig.new
  end

  def edit
  end

  def create
    @rig = Rig.new(rig_params)
    @rig.published = false
    if @rig.save
      flash[:notice] = "Successfully created. Be added after check!"
      redirect_to rigs_path
    else
      render 'new'
    end
  end

  def update
    if @rig.update(rig_params)
      flash[:success] = "Rig updated"
      redirect_to @rig
    else
      render 'edit'
    end
  end

  def show
    @comments = @rig.comment_threads.order('created_at desc')
    @new_comment = Comment.build_from(@rig, current_user.id, "") if user_signed_in?
  end

  def destroy
    Rig.find(params[:id]).destroy
    flash[:success] = "Rig destroyed."
    redirect_to root_url
  end

  def change_public_status
    @rig.change_public_status
    redirect_to :back
  end

  def unpublished
    @search = Rig.unpublished.search(params[:q])
    @rigs = @search.result.order(:name).page(params[:page])
  end

  private

  def rig_params
    params.require(:rig).permit(:name, :photo)
  end

  def set_rig
    @rig = Rig.find(params[:id])
  end

end
