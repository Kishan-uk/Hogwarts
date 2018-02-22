require_relative('./models/student_details.rb')

StudentDetails.delete_all

student1 = StudentDetails.new({
  "first_name" => "Harry",
  "last_name" => "Potter",
  "house" => "Ravenclaw",
  "age" => 16
})

student2 = StudentDetails.new({
  "first_name" => "Hermione",
  "last_name" => "Granger",
  "house" => "Hufflepuff",
  "quantity" => 17
})

student1.save
student2.save
