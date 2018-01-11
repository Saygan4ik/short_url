module Api
  module V1
    class ApiController < ActionController::API
      private

      def authenticate_user
        user_token = request.headers['X-USER-TOKEN']
        return unauthorize unless user_token
        @user = User.find_by_token(user_token)
        unauthorize unless @user
      end

      def unauthorize
        head status: :unauthorized
      end
    end
  end
end
