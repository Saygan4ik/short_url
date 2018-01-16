# frozen_string_literal: true

class Url < ApplicationRecord
  belongs_to :user, counter_cache: true
  enum status: %i[public_url private_url]
  validates :short_url, uniqueness: true
  validates :initial_url, :status, presence: true
  validates :initial_url, uniqueness: { scope: :user_id }
  validate :minimum_quantity_urls_for_user, on: :create

  before_validation :generate_short_url, on: :create

  private

  def generate_short_url
    short_url = SecureRandom.hex(3)
    while Url.where(short_url: short_url).exists?
      short_url = SecureRandom.hex(3)
    end

    self.short_url = short_url
  end

  def minimum_quantity_urls_for_user
    errors.add(:user_id, 'Quantity urls greater then 10') if
        user.urls.count >= 10
  end
end
