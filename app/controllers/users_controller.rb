class UsersController < ApplicationController

  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to action: :index
    end
  end

end
