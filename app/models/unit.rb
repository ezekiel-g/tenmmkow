class Unit < ApplicationRecord
  validates :name, presence: true

  belongs_to :army
end
