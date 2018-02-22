require_relative ('../db/sql_runner.rb')

class StudentDetails

  attr_reader :first_name, :last_name, :house, :age, :id

  def intialize(details);
    @id = details["id"].to_i,
    @first_name = details["first_name"],
    @last_name = details["last_name"],
    @house = details["house"],
    @age = details["age"].to_i
  end

  def pretty_name()
    return "#{@first_name} #{@last_name}"
  end

  def self.delete_all()
    sql = "DELETE FROM students;"
    SqlRunner.run(sql)
  end

  def save()
    sql = "INSERT INTO students
    (
      first_name,
      last_name,
      house,
      age
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING *"
    values = [@first_name, @last_name, @house, @age]
    student_record = SqlRunner.run(sql, values)
    @id = student_record.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM students"
    students = SqlRunner.run(sql)
    result = students.map {|student| StudentDetails.new(student)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM students WHERE id = $1"
    values = [id]
    student = SqlRunner.run(sql, values)
    result = StudentDetails.new(student.first)
    return result
  end

end
