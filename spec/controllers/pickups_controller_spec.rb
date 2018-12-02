require 'rails_helper'

RSpec.describe PickupsController, type: :controller do
  before :each do
    Trip.destroy_all
    Pickup.destroy_all
    Place.destroy_all
    User.destroy_all
    @user = User.create name: 'username', email: 'email@mail.com', password: '123456', password_confirmation: '123456', phone: '+201010101010', role: 'Driver'
  end

  describe "Create" do
    it "create a pickup "do
      sign_in @user
      expect { post :create, params:{pickup: { departure_t: "2018-12-04 23:00:00" ,
                                    source_attributes: {name: "alex"},
                                    destination_attributes: { name: "sinai" } } }
      }.to change(Pickup, :count).by(1)
    end

    it "redirects to the home page upon save" do
      sign_in @user
      post :create, params:{pickup: { departure_t: "2018-12-04 23:00:00" ,
                                    source_attributes: {name: "alex"},
                                    destination_attributes: { name: "sinai" } } }
      response.should redirect_to root_url
    end
  end

  describe "if pickup not save" do
    it "create a pickup but not valid "do
      sign_in @user
      expect { post :create, params:{pickup: { departure_t: nil ,
                                    source_attributes: {name: "alex"},
                                    destination_attributes: { name: "sinai" } } }
      }.to change(Pickup, :count).by(0)
    end
  end

  describe 'DELETE destroy' do
    before :each do
      @pickup = Pickup.create({passenger: @user, departure_t: "2018-12-04 23:00:00" ,
                                    source_attributes: {name: "alex"},
                                    destination_attributes: { name: "sinai" } })
    end

    it "deletes the pickup" do
      sign_in @user
      expect{
        delete :destroy, params: { id: @pickup.id }
      }.to change(Pickup,:count).by(-1)
    end

    it "redirects to root" do
      sign_in @user
      delete :destroy, params: { id: @pickup.id }
      response.should redirect_to root_url
    end
  end
end
