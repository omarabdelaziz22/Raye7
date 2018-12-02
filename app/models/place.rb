class Place < ApplicationRecord
  before_validation :search_coordinates

  validates :name, presence: true, length: { maximum: 20 }
  validates :longitude, :latitude, presence: true
  validates :latitude, uniqueness: {scope: :longitude}

  private

    def search_coordinates
      results = Geocoder.search(:name)
      results.first.coordinates
      self.longitude = results[0]
      self.latitude = results[1]
    end
end
