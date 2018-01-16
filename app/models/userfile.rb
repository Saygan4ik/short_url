# frozen_string_literal: true

class Userfile < ApplicationRecord
  include GenerateShortUrl
  short_url length: 4
  mount_uploader :file, UserFileUploader
  belongs_to :user
  validates :file, presence: true
  validates :short_url, uniqueness: true
end
