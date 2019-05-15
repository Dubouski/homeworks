# Some documentation about Homework.
class Homework
  attr_reader :homework_name, :student_name
  attr_accessor :assessment, :source_code, :remark

  def initialize(homework_name:, student_name:)
    @homework_name = homework_name
    @student_name = student_name
  end
end
