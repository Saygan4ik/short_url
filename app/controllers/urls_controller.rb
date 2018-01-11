# frozen_string_literal: true

require 'securerandom'

class UrlsController < ApplicationController
  before_action :authenticate_user!

  def index
    @urls = current_user.urls
  end

  def new
    @url = Url.new
  end

  def show
    @url = Url.find(params[:id])
    if @url.user_id == current_user[:id]
      @url
    else
      flash[:alert] = 'Access denied'
      redirect_to action: :new
    end
  end

  def create
    if check_url_from_user?(params[:url][:initial_url])
      flash[:notice] = 'This url is exists already'
      redirect_to action: :new
    else
      params[:url][:short_url] = get_short_url
      if @url = current_user.urls.create(url_params)
        redirect_to @url
      else
        redirect_to action: :new
      end
    end
  end

  def destroy
    @url = Url.find(params[:id])
    if @url.user_id == current_user[:id]
      @url.destroy
      flash[:notice] = 'Url deleted'
    else
      flash[:alert] = 'Access denied'
    end

    redirect_to action: :index
  end

  private

  def get_short_url
    @short_url_all = Url.all.select('short_url')
    loop do
      @new_short_url = SecureRandom.hex(3)
      unless @short_url_all.map(&:short_url).include?(@new_short_url.to_s)
        break
      end
    end

    @new_short_url
  end

  def check_url_from_user?(url)
    current_user.urls.map { |item| item[:initial_url] }.include?(url)
  end

  def url_params
    params.require(:url).permit(:initial_url, :short_url)
  end
end
