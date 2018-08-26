class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  has_many :memberships
  has_many :messages
  has_many :armies, through: :memberships
  has_many :groups, through: :memberships
  has_many :owned_groups, class_name: 'Group', foreign_key: 'owner_id'

  def admin?
    role == "admin"
  end
end
