class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
  end

  def edit
    @profile = @user.profile
  end

  def update
    @user.update(user_params)

    if @user.save
      redirect_to @user
    else
      flash[:error] = "Something went wrong when updating your profile."
      redirect_to :back
    end

  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, profile_attributes: [:name, :bio])
  end
end
