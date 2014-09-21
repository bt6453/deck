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

  def shuffle
    #This was my first algorithm to shuffle the deck, until I realized Ruby arrays have a shuffle method
    #now looking at it, realized I could have shuffled it in place by swapping positions instead
    #of 
    #new_cards = []
    #until @cards.empty?
    #  new_cards << @cards.delete_at(rand(@cards.length))
    #end
    #@cards = new_cards
    @cards.shuffle!
  end

  def deal(number_of_cards = 1)
    dealt = []
    number_of_cards.times.each do
      dealt << @cards.pop
    end
    dealt
  end

  def peek
    @cards.last
  end

  def to_s
    @cards.map(&:to_s)
  end

end