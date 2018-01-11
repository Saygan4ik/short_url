# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :name, :email
  has_many :urls
end
