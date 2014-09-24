class Card

  attr_accessor :suit
  attr_accessor :number #string representation
  attr_accessor :value #actual number, useful for sorting (doing it on strings would get the wrong order)

  def initialize(suit, number, value)
    @suit = suit
    @number = number
    @value = value
  end

  def to_s
    "#{@number} of #{@suit}"
  end

  def <=>(other_card)
    @number.to_i <=> other_card.number.to_i
  end

  def ==(other_card)
    @suit == other_card.suit && @number == other_card.number
  end

end