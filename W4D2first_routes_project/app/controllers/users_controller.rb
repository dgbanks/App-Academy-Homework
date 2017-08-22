class UsersController < ApplicationController
  def index
    render plain: "I'm in the index action!"
  end

  def create
    render json: params
  end

  def show
    render json: params
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: user
  end

  def update
    user = User.find(params[:id])
    if user.update_attributes(user_params)
      render json: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
end
