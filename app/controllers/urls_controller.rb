# frozen_string_literal: true

class UrlsController < ApplicationController
  before_action :authenticate_user!, except: :redirect_to_initial_url

  def index
    @urls = current_user.urls
  end

  def new
    @url = Url.new
    if current_user.admin?
      @last_urls = Url.order(created_at: :desc).limit(10)
    else
      @last_public_urls = Url.public_url.order(created_at: :desc).limit(10)
    end
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

  def redirect_to_initial_url
    @url = Url.find_by!(short_url: params[:short_url])
    redirect_to @url.initial_url, status: :permanent_redirect
  end

  private

  def url_params
    params.require(:url).permit(:initial_url, :status)
  end
end
