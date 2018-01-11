# frozen_string_literal: true

class UrlSerializer < ActiveModel::Serializer
  attributes :user_id, :initial_url, :short_url
end
