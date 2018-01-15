# frozen_string_literal: true

class UserfilesController < ApplicationController
  before_action :authenticate_user!

  def index
    @userfiles = current_user.userfiles.page params[:page]
  end

  def show
    @userfile = current_user.userfiles.find(params[:id])
  end

  def new
    @userfile = Userfile.new
  end

  def create
    @userfile = current_user.userfiles.create(userfile_params)
    if @userfile.valid?
      flash[:alert] = 'File saved'
      redirect_to @userfile
    else
      render 'new'
    end
  end

  def destroy
    @file = current_user.userfiles.find(params[:id])
    @file.destroy
    flash[:alert] = 'File deleted'
    redirect_to action: :index
  end

  def redirect_to_file
    @userfile = Userfile.find_by!(short_url: params[:short_url])
    redirect_to @userfile.file.url, status: :permanent_redirect
  end

  private

  def userfile_params
    params.require(:userfile).permit(:file)
  end
end
