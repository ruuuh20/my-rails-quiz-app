class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    devise :omniauthable, :omniauth_providers => [:facebook]

  has_many :user_courses
  has_many :courses, through: :user_courses
  has_many :answers


  def courses_attributes=(courses_attributes)
    courses_attributes.each do |course_attributes|
      self.courses.build(course_attributes)
    end
  end

  def is_admin?
    self.admin == true
  end

  def is_student?
    self.status == "student"
  end

  def is_teacher?
    self.status == "teacher"
  end

  def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
  end
end

end
