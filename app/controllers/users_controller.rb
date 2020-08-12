class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admin?, only: [:edit, :update, :destroy]

  def show
    @user = User.find(params[:id])
    @events = Event.find_by admin_id: params[:id]
  end

  def is_admin?
    redirect_to root_path if user_signed_in? && !current_user.is_admin
   end
end
