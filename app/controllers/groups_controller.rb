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
      redirect_to groups_path
    else
      flash[:notice] = @group.errors.full_messages.join(' * ')
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])

    if @group.update_attributes(group_params)
      flash[:notice] = 'Group edited successfully'
      redirect_to group_path(@group)
    else
      flash[:notice] = @group.errors.full_messages.join(' * ')
      render :edit
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    redirect_to groups_path
  end

  private

  def group_params
    params.require(:group).permit(:name, :description)
  end
end
