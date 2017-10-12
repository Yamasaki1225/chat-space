class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def edit
  end

  def update
    @user.update(user_params)
    if @user.update(user_params)
      redirect_to :root
    else
<<<<<<< Updated upstream
      render :edit
=======
      render :edith
>>>>>>> Stashed changes
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
