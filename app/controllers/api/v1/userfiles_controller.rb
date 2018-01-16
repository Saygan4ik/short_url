# frozen_string_literal: true

module Api
  module V1
    class UserfilesController < ApiController
      before_action :authenticate_user

      def index
        @userfiles = @user.userfiles.page(params[:page]).per(params[:per_page])
        render json: @userfiles,
               each_serializer: UserfileSerializer,
               meta: pagination_dict(@userfiles),
               status: :ok
      end

      def create
        @userfile = @user.userfiles.new(userfile_params)
        if @userfile.save
          render json: @userfile,
                 status: :ok
        else
          render json: @userfile.errors.full_messages,
                 status: :unprocessable_entity
        end
      end

      private

      def userfile_params
        params.require(:userfile).permit(:remote_file_url)
      end
    end
  end
end
