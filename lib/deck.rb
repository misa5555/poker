require_relative 'card'

class Deck
  
  def initialize
    @cards = []
    seed_cards
    shuffle
  end
  
  def seed_cards
    [:hearts, :diamonds, :clubs, :spades].each do |suit|
      (1..13).each do |value| 
        @cards << Card.new(value, suit) 
      end
    end
  end
  
  def draw
    @cards.pop
  end  
  
  def shuffle
    @cards.shuffle!
  end
  
  def remaining_cards
    @cards.length
  end
  
end