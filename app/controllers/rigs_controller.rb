class RigsController < ApplicationController

  load_and_authorize_resource param_method: :rig_params

  def index
    @rigs = Rig.all
  end

  private

  def rig_params
    params.require(:rig).permit(:name, :photo)
  end

  def set_rig
    @rig = Rig.find(params[:id])
  end

end
