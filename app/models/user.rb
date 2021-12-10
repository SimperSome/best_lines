class User < ApplicationRecord
  include JwtToken
  # Direct associations

  has_many   :favorite_lines,
             class_name: "BestLine",
             dependent: :destroy

  # Indirect associations

  has_many   :categories,
             through: :favorite_lines,
             source: :category

  has_many   :favorites,
             through: :favorite_lines,
             source: :book

  # Validations

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
