require 'rails_helper'


RSpec.describe Trip, type: :model do

  before :each do
    Trip.destroy_all
    Pickup.destroy_all
    Place.destroy_all
  end

  subject { described_class.new ({driver: User.new , departure_t: "2018-12-04 23:00:00" , seats: 5,
                                source_attributes: {name: "alex"},
                                destination_attributes: { name: "sinai" } }) }

  it "has none to begin with" do
    expect(Trip.count).to eq 0
  end

  it "has one after adding one" do
    subject.save
    expect(Trip.count).to eq 1
  end

  it "has none after one was created in a previous example" do
    expect(Trip.count).to eq 0
  end

  describe "Associations" do
    it "belongs to driver" do
      assc = described_class.reflect_on_association(:driver)
      expect(assc.macro).to eq :belongs_to
    end

    it "belongs to source" do
      assc = described_class.reflect_on_association(:source)
      expect(assc.macro).to eq :belongs_to
    end

    it "belongs to destination" do
      assc = described_class.reflect_on_association(:destination)
      expect(assc.macro).to eq :belongs_to
    end
  end

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a driver"  do
      subject.driver = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a Departure time" do
      subject.departure_t = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a seats" do
      subject.seats = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a source" do
      subject.source = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a destination"  do
      subject.destination = nil
      expect(subject).to_not be_valid
    end
  end
end
