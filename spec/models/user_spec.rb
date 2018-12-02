require 'rails_helper'

RSpec.describe User, type: :model do

  before :each do
    User.destroy_all
    Trip.destroy_all
    Pickup.destroy_all
    Place.destroy_all
  end

  subject { described_class.new ({email: "nader@mail.com", name: "nader nabil",
                                  phone: "+201118037722", role: "Driver",
                                  password: "123456", password_confirmation: "123456" }) }

  it "has none to begin with" do
    expect(User.count).to eq 0
  end

  it "has one after adding one" do
    subject.save
    expect(User.count).to eq 1
  end

  it "has none after one was created in a previous example" do
    expect(User.count).to eq 0
  end

  describe "Associations" do
    it "has many trips" do
      assc = described_class.reflect_on_association(:trips)
      expect(assc.macro).to eq :has_many
    end

    it "has many pickups" do
      assc = described_class.reflect_on_association(:pickups)
      expect(assc.macro).to eq :has_many
    end
  end
  
  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a name"  do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a phone number" do
      subject.phone = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a role" do
      subject.role = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a password"  do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a password confirmation"  do
      subject.password_confirmation = nil
      expect(subject).to_not be_valid
    end

    it "is not valid with different password confirmation" do
      subject.password_confirmation = "1234"
      expect(subject).to_not be_valid
    end
  end
end
