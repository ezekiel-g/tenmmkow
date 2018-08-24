class Army < ApplicationRecord
  validates :name, presence: true

  has_many :users
  has_many :units, dependent: :destroy
end
