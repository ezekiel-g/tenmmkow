class Unit < ApplicationRecord
  validates :name, presence: true

  belongs_to :army
  has_many :users, through: :fieldings
end
