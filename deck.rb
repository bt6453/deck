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

  def shuffle(&block)
    #This was my first algorithm to shuffle the deck, until I realized Ruby arrays have a shuffle method
    #now looking at it, realized I could have shuffled it in place by swapping positions instead
    #of moving them from one array to another
    #new_cards = []
    #until @cards.empty?
    #  new_cards << @cards.delete_at(rand(@cards.length))
    #end
    #@cards = new_cards
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

  def peek
    @cards.last
  end

  def to_s
    @cards.map(&:to_s)
  end

end