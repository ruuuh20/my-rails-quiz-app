class Course < ApplicationRecord
  has_many :user_courses
  has_many :users, through: :user_courses
  has_many :quizzes

  validates :name, :uniqueness => true
end
