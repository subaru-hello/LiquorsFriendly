# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :liquors, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :drinkings, dependent: :destroy
end
