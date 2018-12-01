class PlacesController < ApplicationController
  before_action :authenticate_user!
  

  def create
  end

  private

    def place_params
      params.require(:place).permit(:name)
    end
end
