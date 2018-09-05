class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :army
  belongs_to :group

  def username
    user = User.where(id: self.user_id)
    user[0].username
  end

  def army_name
    army = Army.where(id: self.army_id)
    army[0].name
  end

  def group_name
    group = Group.where(id: self.group_id)
    group[0].name
  end

  def member_with_army
    user = User.where(id: self.user_id)
    army = Army.where(id: self.army_id)

    "#{user[0].username} fielding #{army[0].name}"
  end
end
