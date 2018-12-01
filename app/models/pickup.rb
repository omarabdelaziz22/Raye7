class Pickup < ApplicationRecord
  belongs_to :passenger, class_name: "User"
  belongs_to :source, class_name: "Place"
  belongs_to :destination, class_name: "Place"

  validates :passenger, presence: true
  validates :source, presence: true
  validates :destination, presence: true
  validate :departure_date_cannot_be_in_the_past

  accepts_nested_attributes_for :source
  accepts_nested_attributes_for :destination

  def departure_date_cannot_be_in_the_past
    errors.add(:base, "Departure time can't be in the past") if
      departure_t.blank? || departure_t < Time.zone.now
  end
end
