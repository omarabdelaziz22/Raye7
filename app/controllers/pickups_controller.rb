class PickupsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @pickup = current_user.pickups.new pickup_params
    if @pickup.save
      flash[:success] = "Pickup created!"
      @feed_pickup = current_user.pickups.paginate(page: params[:page])
      @feed_trip = current_user.trips
      redirect_to root_url
    else
      @feed_pickup = []
      render 'home_page/home'
    end
  end

  def destroy
    @pickup = Pickup.find(params[:id])
    @pickup.destroy
    flash[:success] = "Pickup deleted"
    redirect_to root_url
  end

  private
    def pickup_params
      params.require(:pickup).permit( :passenger, :departure_t,
                                    source_attributes: [ :name ],
                                    destination_attributes: [ :name ])
    end
end
