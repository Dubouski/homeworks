require_relative 'human'
require_relative 'homework'
require_relative 'api'

# Some documentation about class Student.
class Student < Human
  include Comparable
  attr_accessor :homework_list, :mentors

  def initialize(name:, sex:, birthday:)
    @homework_list = []
    @mentors = []
    super
  end

  def write_homework(hw_name, source_code)
    # create new Homework
    new_hw = Homework.new(homework_name: hw_name, student_name: @name)
    new_hw.source_code = source_code
    @homework_list << new_hw
    new_hw
  end

  def submit_homework(hw_name)
    homework = @homework_list.select { |h| h.homework_name == hw_name }
    Api.send_data_as_json(homework, @name, mentors) if homework.first
  end

  def rewrite_homework(hw_name, new_source_code)
    # fix (rewrite) some homework
    homework = @homework_list.pop { |h| h.homework_name == hw_name }
    if homework
      homework.source_code = new_source_code
      @homework_list << homework
    else
      write_homework(hw_name, new_source_code)
    end
  end

  def <=>(other)
    # this method need for module Comparable
    @name && @birthday <=> other.name && other.birthday
  end
end
