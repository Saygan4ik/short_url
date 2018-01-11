# frozen_string_literal: true

class Url < ApplicationRecord
  belongs_to :user
  validates :short_url, uniqueness: true
  validates :initial_url, presence: true
  validates :initial_url, uniqueness: { scope: :user_id }

  before_validation :generate_short_url, on: :create

  private

  def generate_short_url
    short_url = SecureRandom.hex(3)
    while Url.where(short_url: short_url).exists?
      short_url = SecureRandom.hex(3)
    end

    self.short_url = short_url
  end
end
