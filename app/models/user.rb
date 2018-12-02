class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :trips, foreign_key: :driver_id, dependent: :destroy
  has_many :pickups, foreign_key: :passenger_id, dependent: :destroy
  validates :name,  presence: true , length: { in: 6..50 }
  validates :role, presence:true

  validates :password_confirmation,
            presence: true,
            on: :create

  validates :password_confirmation,
            presence: true,
            on: :update,
            unless: lambda{ |u| u.password.blank? }

  validates :password,
            presence: true,
            confirmation: true,
            on: :create

  validates :password,
            on: :update,
            confirmation: true,
            unless: lambda{ |u| u.password.blank? }


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
