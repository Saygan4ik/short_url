# frozen_string_literal: true

class Userfile < ApplicationRecord
  mount_uploader :file, UserFileUploader
  belongs_to :user
  validates :file, presence: true
  validates :short_url, uniqueness: true

  before_validation :generate_short_url, on: :create

  private

  def generate_short_url
    short_url = SecureRandom.hex(4)
    while Userfile.where(short_url: short_url).exists?
      short_url = SecureRandom.hex(4)
    end

    self.short_url = short_url
  end
end
