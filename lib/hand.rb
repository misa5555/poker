require_relative 'card'
class Hand
  def initialize
    @cards = []
  end

  def get_card(card)
    @cards << card
  end
  
  def render
    puts "Your hand contains:"
    @cards.each_with_index do |el, index|
      puts "#{index + 1}: #{el.name}"
    end
  end
  
  def discard(ary)    
    @cards = @cards - ary.map{|el| @cards[el]}
  end
  
  def num_cards
    @cards.length
  end
  
  def value
    if straight_flush?(get_easy_reader)
      return 900000000 + high_card
    end
    if four_of_kind?(get_easy_reader)
      return 80000000 + two_three_four_of_kind
    end
    if full_house?(get_easy_reader)
      return 7000000 + full_house_value
    end
    if flush?(get_easy_reader)
      return 600000 + high_card
    end
    if straight?(get_easy_reader)
      return 50000 + high_card
    end
    if three_of_kind?(get_easy_reader)
      return 4000 +two_three_four_of_kind
    end
    if two_pair?(get_easy_reader)
      return 300 + two_pair_value
    end
    if one_pair?(get_easy_reader)
      return 20 + two_three_four_of_kind
    end
    return high_card.value
  end  
  
  def get_easy_reader
    @cards.map{|card| [card.value, card.suit]}
  end    
  
  
  
  def flush?(simple_hand)
    simple_hand.map{|pair| pair[1]}.uniq.length == 1
  end
  
  def straight?(simple_hand)
    values = simple_hand.map{|pair| pair[0]}.sort
    (0...4).each_with_index do |el, index|
      if values[index + 1] != values[index] + 1
        return false
      end 
    end
    return true
  end
  
  def straight_flush?(simple_hand)
    flush?(simple_hand) && straight?(simple_hand)
  end
  
  def pair?(simple_hand)
    numbers = simple_hand.map{|pair| pair[0]}
    (numbers.length - numbers.uniq.length) == 1
  end
  
  def two_pair?(simple_hand)
    counter = Hash.new(0)
    simple_hand.each do |elem|
      counter[elem[0]] += 1 
    end  
    counter.values.sort == [1,2,2]
  end
  
  def three_of_kind?(simple_hand)
    numbers = simple_hand.map{|pair| pair[0]}
    (numbers.length - numbers.uniq.length) == 2
  end
  
  def four_of_kind?(simple_hand)
    numbers = simple_hand.map{|pair| pair[0]}
    (numbers.length - numbers.uniq.length) == 3
  end
  
  def full_house?(simple_hand)
    counter = Hash.new(0)
    simple_hand.each do |elem|
      counter[elem[0]] += 1 
    end  
    counter.values.sort == [2,3]
  end
  
  def high_card
    highest_card = @cards[0]
    @cards.each{|elem| highest_card = elem if highest_card.value < elem.value}
    highest_card
  end
  

  def two_three_four_of_kind
    counter = Hash.new(0)
    simple_hand.each do |elem|
      counter[elem[0]] += 1
      return elem if counter[elem[0]]>1 
    end  
  end 
  
  def full_house_value(simple_hand)
    counter = Hash.new(0)
    simple_hand.each do |elem|
      counter[elem[0]] += 1
      return elem if counter[elem[0]]>=3 
    end  
  end 
  
   
  
end