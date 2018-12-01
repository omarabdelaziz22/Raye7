class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :trips, foreign_key: :driver_id, dependent: :destroy
  has_many :pickups, foreign_key: :passenger_id, dependent: :destroy
  validates :name,  presence: true , length: { in: 6..50 }
  VALID_PHONE_REGEX = /\+201[0-9]+\z/
  validates :phone, presence: true,
                 format: { with: VALID_PHONE_REGEX },
                 length: { is: 13 },
                 uniqueness:

  def driver?
    role == "Driver"
  end

  def passenger?
    role == "Passenger"
  end
end
