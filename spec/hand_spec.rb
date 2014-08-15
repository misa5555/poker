# subject(:hand) {Hand.new}
#
#
# ... test hand methods
#
#
# let(:flush_hand) { Hand.new(...) }
#
# let(:four_of_kind) { ... }
#
#
# flush_hand.value to eq :flush
#
#
#
#
# expect flush_hand.beats?(three-of-kind) to eq(true)
require 'rspec'
require 'card'
require 'hand'

describe Hand do
  subject(:hand){Hand.new}
  
  it "has no card initially" do
    expect( hand.cards.length).to eq(0)
  end
  
  it "can draw cards" do 
    c1 = Card.new(7,:hearts)
    c2 = Card.new(13, :clubs)
    c3 = Card.new(7, :diamonds)
    hand.get_card(c1)
    hand.get_card(c2)
    hand.get_card(c3)
    expect(hand.num_cards).to eq(3)
  end 
   

  it "can discard" do
    c1 = Card.new(7,:hearts)
    c2 = Card.new(13, :clubs)
    c3 = Card.new(7, :diamonds)
    hand.get_card(c1)
    hand.get_card(c2)
    hand.get_card(c3)
    hand.discard([1,2])
    expect(hand.num_cards).to eq(1)
  end

  it "can compute value of various hands" do
    
  end








end


