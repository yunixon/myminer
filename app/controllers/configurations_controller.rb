class ConfigurationsController < ApplicationController
  load_and_authorize_resource param_method: :configuration_params
  before_action :set_config, only: [:show, :edit, :update]

  def index
    @search = ::Configuration.published.search(params[:q])
    @configurations = @search.result.order(:nick).page(params[:page])
  end

  def new
    @configuration = ::Configuration.new
  end

  def edit
  end

  def create
    @configuration = ::Configuration.new(configuration_params)
    @configuration.published = false
    if @configuration.save
      flash[:notice] = t(:config_create)
      redirect_to root_url
    else
      render 'new'
    end
  end

  def update
    if @configuration.update(configuration_params)
      flash[:success] = t(:config_update)
      redirect_to @configuration
    else
      render 'edit'
    end
  end

  def show
    @comments = @configuration.comment_threads.order('created_at desc')
    @new_comment = Comment.build_from(@configuration, current_user.id, "") if user_signed_in?
  end

  def destroy
    ::Configuration.find(params[:id]).destroy
    flash[:success] = t(:config_delete)
    redirect_to root_url
  end

  def change_public_status
    @configuration.change_public_status
    redirect_to :back
  end

  def unpublished
    @search = ::Configuration.unpublished.search(params[:q])
    @configurations = @search.result.order(:nick).page(params[:page])
  end

  private

  def configuration_params
    params.require(:configuration).permit(:nick, :algo_type_id, :hw_type_id, :hw_name,
      :hash_speed_id, :mb, :driver, :miner, :config, :hashrate, :miner_pic, :gpuz_pic)
  end

  def set_config
    @configuration = ::Configuration.find(params[:id])
  end

end
