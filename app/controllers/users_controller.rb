class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def edit
    @user = set_user
  end

  def update
    @user = set_user
    @user.update(user_params)
    if @user.update(user_params)
      redirect_to :root
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
