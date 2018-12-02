require 'rails_helper'

RSpec.describe Place, type: :model do

  before :each do
    Trip.destroy_all
    Pickup.destroy_all
    Place.destroy_all
  end

  subject { described_class.new ({name: "alex", longitude: "0x007f9c2fbc5908",
                                  latitude: "0x007f9c2fbc2b40" }) }

  it "has none to begin with" do
    expect(Place.count).to eq 0
  end

  it "has one after adding one" do
   subject.save
   expect(Place.count).to eq 1
  end

  it "has none after one was created in a previous example" do
    expect(Place.count).to eq 0
  end

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a name"  do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "always set longitude automatically"  do
      subject.longitude = nil
      subject.save
      expect(subject.longitude).to_not be_nil
      expect(subject).to be_valid
    end

    it "is not valid without a latitude"  do
      subject.latitude = nil
      subject.save
      expect(subject.latitude).to_not be_nil
      expect(subject).to be_valid
    end
  end
end
