class User < ApplicationRecord
  has_many :courses
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  HOUSES = {
    'Gryffindor': 'gryffindor',
    'Slytherin': 'slytherin',
    'Ravenclaw': 'ravenclaw',
    'Hufflepuff': 'hufflepuff'
  }

  def humanized_house
    HOUSES.invert[self.rating]
  end
end
