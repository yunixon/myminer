class ConfigurationsController < ApplicationController
  
  before_action :set_config, only: [:show, :edit, :update]
  layout 'main'
  
  def index
    @configurations = ::Configuration.all
  end
  
  def new
    @configuration = ::Configuration.new
  end
  
  def edit
  end
  
  def create
    @configuration = ::Configuration.new(configuration_params)
    if @configuration.save
      flash[:notice] = "Successfully created Config." 
      redirect_to @configuration
    else
      render 'new'
    end
  end
  
  def update
    if @configuration.update(configuration_params)
      flash[:success] = "Config updated"
      redirect_to @configuration
    else
      render 'edit'
    end
  end

  def show
  end
  
  def destroy
    ::Configuration.find(params[:id]).destroy
    flash[:success] = "Config destroyed."
    redirect_to root_url
  end
  
  private
  
  def configuration_params
    params.require(:configuration).permit(:nick, :cpu, :motherboard, :video,
      :miner, :config)
  end
  
  def set_config
    @configuration = ::Configuration.find(params[:id])
  end
 
end
