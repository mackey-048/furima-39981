class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      Rails.logger.debug @user.errors.full_messages
      render 'new'
    end
  end
end
