class User < ApplicationRecord
  include JwtToken
  # Direct associations

  has_many   :favorite_lines,
             class_name: "BestLine",
             dependent: :destroy

  # Indirect associations

  has_many   :books,
             through: :favorite_lines,
             source: :book

  # Validations

  validates :username, presence: true

  # Scopes

  def to_s
    username
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
