class Url < ApplicationRecord
  belongs_to :user
  validates :short_url, uniqueness: true
  validates :initial_url, presence: true
end
