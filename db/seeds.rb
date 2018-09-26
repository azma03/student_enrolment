require_relative('../models/student')
require_relative('../models/house')

Student.delete_all()
House.delete_all()

house1 = House.new({
  "name" => "Gryffindor"
  })
house1.save()

house2 = House.new({
  "name" => "Ravenclaw"
  })
house2.save()

house3 = House.new({
  "name" => "Hufflepuff"
  })
house3.save()

house4 = House.new({
  "name" => "Slytherin"
  })
house4.save()


student1 = Student.new({
  "first_name" => "Valentina",
  "last_name" => "Bonetti",
  "house_id" => house1.id,
  "age" => 15
  })
student1.save()

student2 = Student.new({
  "first_name" => "Asma",
  "last_name" => "Malik",
  "house_id" => house1.id,
  "age" => 16
  })
student2.save()

student3 = Student.new({
  "first_name" => "John",
  "last_name" => "Green",
  "house_id" => house2.id,
  "age" => 20
  })
student3.save()
