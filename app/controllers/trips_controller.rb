class TripsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  def create
    @trip = current_user.trips.new trip_params
    if @trip.save
      flash[:success] = "Trip created!"
      @feed_trip = current_user.trips.paginate(page: params[:page])
      @feed_pickup = current_user.pickups #paginate(page: params[:page])
      redirect_to root_url
    else
      @feed_trip = []
      render 'home_page/home'
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    flash[:success] = "Trip deleted"
    redirect_to root_url
  end

  private

    def trip_params
      params.require(:trip).permit( :driver, :departure_t, :seats,
                                    source_attributes: [ :name ],
                                    destination_attributes: [ :name ])
    end
end
