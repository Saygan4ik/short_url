# frozen_string_literal: true

class Users::UsersController < ApplicationController
  before_action :authenticate_user!, :access?

  def index
    @users = User.order(id: :asc).page params[:page]
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  private

  def access?
    unless current_user.admin?
      flash[:alert] = 'Access denied'
      redirect_to root_url
    end
  end
end
