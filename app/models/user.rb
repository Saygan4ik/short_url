# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_secure_token
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
  has_many :urls, dependent: :destroy
  has_many :userfiles, dependent: :destroy
  enum role: %i[user admin]
end
