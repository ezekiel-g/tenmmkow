class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :army
  belongs_to :group

  validates :rp, numericality: true
end
