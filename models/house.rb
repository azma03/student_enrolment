require_relative('../db/sql_runner')

class House
  attr_accessor :name, :logo
  attr_reader :id

  def initialize(options)
    @id = options["id"].to_i
    @name = options["name"]
    @logo = "default logo"
  end

  def save()
    sql = "INSERT INTO houses (name, logo) VALUES ($1, $2) RETURNING *"
    values = [@name, @logo]
    house = SqlRunner.run(sql, values)
    @id = house.first()["id"].to_i
  end

  def update()
    sql = "UPDATE houses SET (name, logo) = ($1, $2) WHERE id = $3"
    values = [@name, @logo, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM houses WHERE id =$1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM houses"
    houses = SqlRunner.run(sql)
    return houses.map {|house| House.new(house)}
  end

  def self.find(id)
    sql = "SELECT * FROM houses WHERE id = $1"
    values =[id]
    house = SqlRunner.run(sql, values)
    return House.new(house.first())
  end

  def self.delete_all()
    sql = "DELETE FROM houses"
    SqlRunner.run(sql)
  end

end
