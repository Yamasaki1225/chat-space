class GroupsController < ApplicationController

  def index
    @groups = current_usser.groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to :root, notice: "グループを作成しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to :root
    else
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

end
