require 'rspec'
require 'deck'

describe Deck do
  subject(:deck){Deck.new}
  
  it "has 52 cards" do 
    expect(deck.remaining_cards).to eq(52)
  end
  
  it "can draw cards" do
    card = deck.draw
    expect(card.class).to eq(Card)
    expect(deck.remaining_cards).to eq(51)
  end
  
  it "knows if it's empty" do
    all_the_cards = []
    52.times{|card| all_the_cards << deck.draw}
    expect(deck.remaining_cards).to eq(0) 
  end
  
  it "all the cards are different" do
    all_the_cards = []
    52.times{|card| all_the_cards << deck.draw} 
    expect(all_the_cards.uniq.length).to eq(all_the_cards.length)
  end
  
  
  it "can shuffle" do
    shuffled_deck = deck.shuffle
    all_the_cards = []
    flag = true
    52.times{|card| all_the_cards << deck.draw}
    all_the_cards.each_with_index do |card, i|
      flag = false if shuffled_deck[i] != all_the_cards
    end  
    expect(flag).not_to eq(true) 
  end
  
end

