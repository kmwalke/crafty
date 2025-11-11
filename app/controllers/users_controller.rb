class UsersController < ApplicationController
  before_action :logged_in
  before_action :set_user

  def edit
    redirect_to game_path if @player != @user
  end

  def update
    redirect_to game_path if @player != @user
    game_action path: edit_user_path(@user) do
      @user.update(user_params)
    end
  end

  private

  def set_user
    @user = User.find(params.expect(:id))
  end

  def user_params
    params.expect(user: [:name, :email, :password, :password_confirmation])
  end
end
