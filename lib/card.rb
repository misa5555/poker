class Card
  CARD_NAME = {1=>"Ace", 11=>"Jack", 12=>"Queen", 13=>"King"}
  
  attr_reader :value, :suit
  
  def initialize(value, suit)
    @value = value
    @suit = suit
  end
  
  
  def name
    unless CARD_NAME.key?(@value)
      return "#{@value} of #{@suit}"
    else
       return "#{CARD_NAME[@value]} of #{@suit}"
    end  
  end  
    
end