class Quiz < ApplicationRecord
  belongs_to :course
  has_many :questions

  #custom setter (convenience attributes on models)
  def course_name=(name)
    self.course = Course.find_or_create_by(name: name)
  end

  def self.by_course(course_id)
    where(course: course_id)
  end

  def self.in_progress
    where("status = 'In Progress'")
  end

  def self.submitted
    where("status = 'Submitted'")
  end

  def self.not_submitted
    where("status = 'Not submitted'")
  end










end
