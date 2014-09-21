class Card

  attr_accessor :suite
  attr_accessor :number

  def initialize(suite, number)
    @suite = suite
    @number = number
  end

  def to_s
    "#{@number} of #{@suite}"
  end
end