class User < ApplicationRecord
  include JwtToken
  # Direct associations

  has_many   :favorite_lines,
             class_name: "BestLine",
             dependent: :destroy

  has_many   :reading_list,
             class_name: "Book"

  # Indirect associations

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
