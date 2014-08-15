require 'deck'
require 'player'

class Game
  attr_reader :pot, :players, :current_players
  
  def initialize(*players) 
    @deck = Deck.new
    @deck.shuffle
    @players = [players]
    @current_player = @players.first
    @current_players =[]
    @pot = 0
  end
  
  def run
    @current_players = @players
    current_bet = 1 
     #I: each player is dealt five cards
    @current_players.each{|player| deal_hand(player)}
    current_bet = players_bet(current_bet)  #II: players bet
    players_discard    #III: players discard
    current_bet = players_bet(current_bet)  #IV: players bet
    print "winner is #{compute_winner.name}"    #V: compute winner
  end
  
  def fold!(player)
    @current_players.delete(player)
  end

  def deal_hand(player)
    5.times{player.deal(@deck.draw)}
  end
  
  
   #!!add more later!
  def players_bet(current_bet)
    @current_players.each do |player| 
      action = player.choose_action
      fold!(player) if action == :fold
      next if action == :see #more conditions later
      if action == :bet
        player_bet = player.bet(current_bet) if action == :bet #play: later
        curret_bet = bet if curret_bet < bet
        @pot += player_bet
      end  
    end
    current_bet
  end  
  
  def players_discard
    @current_players.each do |player|
      discard_number = player.discard
      discard_number.times {player.deal(@deck.draw)}
      player.hand.render
    end
      
  end
  
  def compute_winner 
    highest_value = 0
    winner = nil
    @current_player.each do |player|
      if player.hand_reveal > highest_value
        highest_value = player.hand_reveal
        winner = player
      end  
    end  
    winner
  end
end