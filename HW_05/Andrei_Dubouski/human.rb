##
# This class represents an human.

class Human
  # We are all humans)
  attr_accessor :name, :sex
  attr_reader :birthday, :height # only reader

  def initialize(name:, sex:, birthday:, height:)
    @name = name
    @sex = sex
    @birthday = birthday
    @height = height
  end

end