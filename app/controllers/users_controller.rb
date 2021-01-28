class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: :show
  def show; end

  private

  def set_user
    @user = User.find(params[:id])
    redirect_to current_user, notice: 'Access Forbidden' unless @user == current_user
  end
end
