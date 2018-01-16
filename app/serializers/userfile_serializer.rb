# frozen_string_literal: true

class UserfileSerializer < ActiveModel::Serializer
  attributes :user, :file, :short_url
  belongs_to :user
end
