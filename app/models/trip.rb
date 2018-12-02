class Trip < ApplicationRecord
  belongs_to :driver, class_name: "User"
  belongs_to :source, class_name: "Place"
  belongs_to :destination, class_name: "Place"

  validates :driver, presence: true
  validates :source, presence: true
  validates :destination, presence: true
  validates :departure_t, presence: true
  validate :departure_date_cannot_be_in_the_past
  validates_numericality_of :seats, only_integer: true, greater_than_or_equal_to: 3

  accepts_nested_attributes_for :source, update_only: true
  accepts_nested_attributes_for :destination, update_only: true

  def departure_date_cannot_be_in_the_past
    errors.add(:base, "Departure time can't be in the past") if
     departure_t.blank? || departure_t < Time.zone.now
  end
end
