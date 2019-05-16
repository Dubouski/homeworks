# frozen_string_literal: true

# Some documentation about Homework.
class Homework
  attr_reader :homework_name, :student_name
  attr_accessor :assessment, :source_code, :remark

  def initialize(homework_name:, student_name:)
    @homework_name = homework_name
    @student_name = student_name
  end

  def to_s
    # present something like ["Student #student_name has sent #homework_name"]
    "Student #{student_name} has sent #{homework_name}"
  end
end
