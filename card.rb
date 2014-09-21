class Card

  attr_accessor :suit
  attr_accessor :number

  def initialize(suit, number)
    @suit = suit
    @number = number
  end

  def to_s
    "#{@number} of #{@suit}"
  end

  def <=>(other_card)
    @number.to_i <=> other_card.number.to_i
  end

end