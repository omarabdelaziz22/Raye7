require 'rails_helper'

RSpec.describe TripsController, type: :controller do
  before :each do
    Trip.destroy_all
    Pickup.destroy_all
    Place.destroy_all
    User.destroy_all
    @user = User.create name: 'username', email: 'email@mail.com', password: '123456', password_confirmation: '123456', phone: '+201010101010', role: 'Driver'
  end

  describe "Create" do
    it "create a trip "do
      sign_in @user
      expect { post :create, params:{trip: { departure_t: "2018-12-04 23:00:00" , seats: 5,
                                    source_attributes: {name: "alex"},
                                    destination_attributes: { name: "sinai" } } }
      }.to change(Trip, :count).by(1)
    end

    it "redirects to the home page upon save" do
      sign_in @user
      post :create, params:{trip: { departure_t: "2018-12-04 23:00:00" , seats: 5,
                                    source_attributes: {name: "alex"},
                                    destination_attributes: { name: "sinai" } } }
      response.should redirect_to root_url
    end
  end

  describe "if trip not save" do
    it "create a trip but not valid "do
      sign_in @user
      expect { post :create, params:{trip: { departure_t: "2018-12-04 23:00:00" , seats: nil,
                                    source_attributes: {name: "alex"},
                                    destination_attributes: { name: "sinai" } } }
      }.to change(Trip, :count).by(0)
    end
  end

  describe 'DELETE destroy' do
    before :each do
      @trip = Trip.create({driver: @user, departure_t: "2018-12-04 23:00:00" , seats: 5,
                                    source_attributes: {name: "alex"},
                                    destination_attributes: { name: "sinai" } })
    end

    it "deletes the trip" do
      sign_in @user
      expect{
        delete :destroy, params: { id: @trip.id }
      }.to change(Trip,:count).by(-1)
    end

    it "redirects to root" do
      sign_in @user
      delete :destroy, params: { id: @trip.id }
      response.should redirect_to root_url
    end
  end
end
