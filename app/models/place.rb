class Place < ApplicationRecord
  before_save :search_coordinates, only: :create
  validates :name, presence: true, length: { maximum: 20 }
  validates :latitude, uniqueness: {scope: :longitude}


  private

    def search_coordinates
      results = Geocoder.search(:name)
      results.first.coordinates
      self.longitude = results[0]
      self.latitude = results[1]
    end
end
