class Quiz < ApplicationRecord
  belongs_to :course
  has_many :questions

  #custom setter (convenience attributes on models)
  def course_name=(name)
    self.course = Course.find_or_create_by(name: name)
  end


end
