# frozen_string_literal: true

class Url < ApplicationRecord
  include GenerateShortUrl
  short_url length: 3
  belongs_to :user, counter_cache: true
  enum status: %i[public_url private_url]
  validates :short_url, uniqueness: true
  validates :initial_url, :status, presence: true
  validates :initial_url, uniqueness: { scope: :user_id }
  validate :minimum_quantity_urls_for_user, on: :create

  private

  def minimum_quantity_urls_for_user
    errors.add(:user_id, 'Quantity urls greater then 10') if
        user.urls.count >= 10
  end
end
