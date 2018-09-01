class Api::V1::GroupsController < ApplicationController

  def index
    @groups = Group.all
    render json: @groups
  end

  def show
    group = Group.find(params[:id])
    owner = User.where(id: group.owner_id)

    if current_user
      current_user_id = current_user.id
      current_user_admin = current_user.admin?
    else
      current_user_id = nil
      current_user_admin = false
    end

    render json: { group: group, owner: owner, current_user: {id: current_user_id, admin: current_user_admin} }
  end
end
