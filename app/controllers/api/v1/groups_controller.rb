class Api::V1::GroupsController < ApplicationController

  def index
    @groups = Group.all

    if current_user
      current_user_id = current_user.id
      current_user_admin = current_user.admin?
    else
      current_user_id = nil
      current_user_admin = false
    end

    render json: { groups: @groups, current_user: {id: current_user_id, admin: current_user_admin } }
  end

  def show
    group = Group.find(params[:id])
    owner = User.where(id: group.owner_id)
    memberships = Membership.where(group_id: group.id)
    members_with_armies = []
    member_Ids = []
    memberships.each do |m|
      members_with_armies << m.member_with_army
      member_Ids << m.user_id
    end

    if current_user
      current_user_id = current_user.id
      current_user_admin = current_user.admin?
    else
      current_user_id = nil
      current_user_admin = false
    end

    render json: { group: group, owner: owner, current_user: {id: current_user_id, admin: current_user_admin}, members_with_armies: members_with_armies, member_Ids: member_Ids }
  end
end
