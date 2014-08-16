require_relative 'hand'

class Player
  attr_reader :pot, :name, :hand #hand is just for testing
  
  def initialize(pot, name)
    @pot = pot
    @name = name
    @hand = Hand.new
  end
  
  def deal(card)
    @hand.get_card(card)
  end

  def choose_action
    puts "What do you wish to do? (bet/see/fold)"
    input = gets.chomp!.downcase # (bet/see/fold)
    case input
      when "bet"
        return :bet
      when "see"
        return :see
      when "fold"   
        return :fold
      else
        raise InvalidInputError
    end
  rescue InvalidInputError => e
    puts e.message
    retry
  end

  def bet(curr)
    puts "The current bet is #{curr}. You must bet at least this much."
    player_bet = Integer(gets.chomp)
    raise NotLargeEnoughError if player_bet < curr
    @pot -= player_bet
    return player_bet 
  rescue NotLargeEnoughError => e
    puts e.message
    retry
  end
  
  def discard
    @hand.render
    puts "Input the cards you want to discard ex) 1 2"
    input = gets.chomp!.split(" ").map{|el|Integer(el)}
    @hand.discard(input)
    input.length
  end
    
  def hand_reveal
    @hand.render
    return @hand.value
  end

end

class NotLargeEnoughError < StandardError
end
class InvalidInputError < StandardError
end
