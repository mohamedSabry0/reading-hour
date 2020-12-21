class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[show destroy]
  def show; end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
    redirect_to current_user, notice: 'Access Forbidden' unless @user == current_user
  end

  def user_params
    params.require(:user).permit(:username)
  end
end
