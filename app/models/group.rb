class Group < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  belongs_to :owner, class_name: 'User'

  has_many :memberships
  has_many :users, through: :memberships
  has_many :armies, through: :memberships
  has_many :messages, dependent: :destroy
end
