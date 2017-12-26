class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
    @user.profile = Profile.new(user_id: @user.id)
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    @user.profile = Profile.create(profile_params)
    if @user.save
      flash[:notice] = 'User was successfully created.'
      redirect_to @user
    else
      flash.now[:error] = 'There was a problem.'
      render :new
    end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = 'User was successfully updated.'
      redirect_to @user
    else
      flash.now[:error] = 'There was a problem.'
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = 'User was successfully destroyed.'
    redirect_to users_url
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:id, :beer_id, :cat_id, :color_id, :food_id)
  end

  def user_params
    params.require(:user).permit(:name, profile: [:id, :beer_id, :cat_id, :color_id, :food_id])
  end
end
