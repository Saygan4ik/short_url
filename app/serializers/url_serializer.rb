# frozen_string_literal: true

class UrlSerializer < ActiveModel::Serializer
  attributes :user, :initial_url, :short_url
  belongs_to :user
end
