class Army < ApplicationRecord
  validates :name, presence: true

  has_many :units, dependent: :destroy
  has_many :memberships
  has_many :users, through: :memberships
  has_many :groups, through: :memberships
end
