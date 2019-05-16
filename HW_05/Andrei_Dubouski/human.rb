# frozen_string_literal: true

# Some documentation about Human.
# 'Human' is superclass for Mentor and Student.
class Human
  # We are all humans)
  attr_accessor :name, :sex
  attr_reader :birthday # only reader

  def initialize(name:, sex:, birthday:)
    @name = name
    @sex = sex
    @birthday = birthday
  end
end
