# frozen_string_literal: true

module Api
  module V1
    class ApiController < ActionController::API
      private

      def pagination_dict(collection)
        {
          current_page: collection.current_page,
          next_page: collection.next_page,
          prev_page: collection.prev_page,
          total_pages: collection.total_pages,
          total_count: collection.total_count
        }
      end

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
