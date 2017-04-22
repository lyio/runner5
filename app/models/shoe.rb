class Shoe < ApplicationRecord
  validates :name, :bought_when, presence: true

  belongs_to :user
  has_many :runs

  scope :own, -> (user) { where(user_id: user.id)  }

  def mileage
    runs.sum('distance')
  end
end
