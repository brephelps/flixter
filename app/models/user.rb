class User < ApplicationRecord
  has_many :courses
  has_many :enrollments
  has_many :enrolled_courses, through: :enrollments, source: :course
  
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

  def house_selection
    HOUSES.invert[self.house]
  end

  def enrolled_in?(course)
    return enrolled_courses.include?(course)
  end

end
