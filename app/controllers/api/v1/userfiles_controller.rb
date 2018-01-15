# frozen_string_literal: true

module Api
  module V1
    class UserfilesController < ApiController
      before_action :authenticate_user

      def index
        @userfiles = @user.userfiles.page(params[:page]).per(params[:per_page])
        render json: @userfiles, serializer: PaginationSerializer, status: :ok
      end
    end
  end
end
