require_relative('../db/sql_runner')

class Student
  attr_accessor :first_name, :last_name, :house_id, :age
  attr_reader :id

  def initialize(options)
    @id = options["id"].to_i
    @first_name = options["first_name"]
    @last_name = options["last_name"]
    @house_id = options["house_id"]
    @age = options["age"]
  end

  def save()
    sql = "INSERT INTO students (first_name, last_name, house_id, age) VALUES ($1, $2, $3, $4) RETURNING *"
    values = [@first_name, @last_name, @house_id, @age]
    student = SqlRunner.run(sql, values)
    @id = student.first()["id"].to_i
  end

  def update()
    sql = "UPDATE student SET (first_name, last_name, house_id, age) = ($1, $2, $3, $4) WHERE id = $5"
    values = [@first_name, @last_name, @house_id, @age, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM students WHERE id =$1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def show_house()
    sql = "SELECT houses.*
    FROM houses
    INNER JOIN students
    ON houses.id = students.house_id
    WHERE students.id = $1"
    values =[@id]
    house = SqlRunner.run(sql, values)
    return House.new(house.first())
  end

  def self.all()
    sql = "SELECT * FROM students"
    students = SqlRunner.run(sql)
    return students.map {|student| Student.new(student)}
  end

  def self.find(id)
    sql = "SELECT * FROM students WHERE id = $1"
    values =[id]
    student = SqlRunner.run(sql, values)
    return Student.new(student.first())
  end

  def self.delete_all()
    sql = "DELETE FROM students"
    SqlRunner.run(sql)
  end

end
