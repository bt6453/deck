class Deck
  attr_reader :cards
  #ignoring jokers
  #All of the suits
  SUITS = ['Hearts', 'Diamonds', 'Clubs', 'Spades']
  #all of the numbers, 2 thorugh 10 plus Jack, Queen, King, and Ace
  NUMBERS = (2..10).map(&:to_s) + ['JACK', 'QUEEN', 'KING', 'ACE']

  def initialize
    @cards = []
    SUITS.each do |suit|
      NUMBERS.each do |number|
        @cards << Card.new(suit, number)
      end
    end
  end

end