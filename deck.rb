class Deck
  attr_reader :cards
  #ignoring jokers
  #All of the suits
  SUITS = %w(Hearts Diamonds Clubs Spades)
  #all of the numbers, 2 thorugh 10 plus Jack, Queen, King, and Ace
  NUMBER_VALUES_MAP = { '2' => 2,
                        '3' => 3,
                        '4' => 4,
                        '5' => 5,
                        '6' => 6,
                        '7' => 7,
                        '8' => 8,
                        '9' => 9,
                        '10' => 10,
                        'J' => 11,
                        'Q' => 12,
                        'K' => 13,
                        'A' => 14
                      }

  def initialize
    @cards = []
    SUITS.each do |suit|
      NUMBER_VALUES_MAP.each do |number, value|
        @cards << Card.new(suit, number, value)
      end
    end
  end

  #the block is so a user can pass their way to shuffle the cards.
  #The block should return an array of Card objects.
  def shuffle(&block)
    if block_given?
      @cards = yield(@cards)
    else
      @cards.shuffle!
    end
  end

  def deal(number_of_cards = 1)
    dealt = []
    number_of_cards.times.each do
      dealt << @cards.pop
    end
    dealt
  end

  #This will allow the "dealer" to put cards back in the deck
  def collect_cards(cards)
    @cards += cards
  end

  def peek
    @cards.last
  end

  def to_s
    @cards.map(&:to_s)
  end

end