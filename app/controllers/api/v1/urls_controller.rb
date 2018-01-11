module Api
  module V1
    class UrlsController < ApiController
      before_action :authenticate_user

      def index
        @urls = @user.urls
        render json: @urls, status: :ok
      end

      def show
        @url = @user.urls.find_by(id: params[:id])
        if @url.nil?
          render json: { message: 'Url is not found' },
                 status: :not_found
        else
          render json: @url,
                 status: :ok
        end
      end

      def create
        @url = @user.urls.new(initial_url: params[:initial_url])
        if @url.save
          render json: @url,
                 status: :ok
        else
          render json: @url.errors.full_messages,
                 status: :unprocessable_entity
        end
      end

      def destroy
        @url = @user.urls.find_by(id: params[:id])
        if @url.nil?
          render json: { message: 'Url is not found' },
                 status: :not_found
        else
          @url.destroy
          render json: {  message: 'Url deleted' },
                 status: :ok
        end
      end
    end
  end
end
