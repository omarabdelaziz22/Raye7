class HomePageController < ApplicationController
  before_action :authenticate_user!

  def home
    if current_user.driver?
      @trip = Trip.new
      @trip.build_source
      @trip.build_destination
    else
      @pickup = Pickup.new
      @pickup.build_source
      @pickup.build_destination
    end

    @feed_pickup = current_user.pickups.paginate(page: params[:page])
    @feed_trip = current_user.trips.paginate(page: params[:page])
  end
end
