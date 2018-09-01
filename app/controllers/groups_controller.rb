class GroupsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id

    if @group.save
      flash[:notice] = 'Group added successfully'
    else
      flash[:notice] = @group.errors.full_messages
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])

    if @group.update_attriutes(group_params)
      flash[:notice] = 'Group edited successfully'
    else
      flash[:notice] = @group.errors.full_messages
      render :edit
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :description)
  end
end
