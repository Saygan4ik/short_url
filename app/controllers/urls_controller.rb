# frozen_string_literal: true

class UrlsController < ApplicationController
  before_action :authenticate_user!

  def index
    @urls = current_user.urls
  end

  def new
    @url = Url.new
  end

  def show
    @url = current_user.urls.find(params[:id])
  end

  def create
    @url = current_user.urls.create(url_params)
    if @url.valid?
      flash[:alert] = 'Short url created'
      redirect_to @url
    else
      render :new
    end
  end

  def destroy
    @url = current_user.urls.find(params[:id])
    @url.destroy
    flash[:notice] = 'Url deleted'

    redirect_to action: :index
  end

  private

  def url_params
    params.require(:url).permit(:initial_url)
  end
end
