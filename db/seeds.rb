# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(:email => "iamadmin@example.com",
            :password => "password",
            :admin => true)
user2 = User.create(:email => "notadmin@example.com",
            :password => "password",
            :admin => false)

course1 = Course.create(:name => "English A")

quiz1 = Quiz.create(:title => "Vocabulary Quiz 1", :description => "Vocabulary section 1 blah blah", :course_id => 4, :status => "Not Submitted")

quiz2 = Quiz.create(:title => "Book Quiz 1", :description => "Book 1 hihihi", :course_id => 1, :status => "Submitted")

quiz3 = Quiz.create(:title => "Book Quiz 3", :description => "Book 1 hihihi", :course_id => 2, :status => "In Progress")
