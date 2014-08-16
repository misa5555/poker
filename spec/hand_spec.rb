require 'rspec'
require 'card'
require 'hand'

describe Hand do
  subject(:hand){Hand.new}
  
  it "has no card initially" do
    expect( hand.num_cards).to eq(0)
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

  it "can detect a pair" do
    c1 = Card.new(7, :clubs)
    c2 = Card.new(7, :diamonds)
    hand.get_card(c1)
    hand.get_card(c2)
    expect(hand.pair?(hand.get_easy_reader)).to eq(true)
  end

  it "can detect a three of a kind" do
    c1 = Card.new(7, :clubs)
    c2 = Card.new(7, :diamonds)
    c3 = Card.new(7, :spades)
    hand.get_card(c1)
    hand.get_card(c2)
    hand.get_card(c3)
    expect(hand.three_of_kind?(hand.get_easy_reader)).to eq(true)
  end
  
  it "can detect a four of a kind" do
    c1 = Card.new(7, :clubs)
    c2 = Card.new(7, :diamonds)
    c3 = Card.new(7, :spades)
    c4 = Card.new(7, :hearts)
    hand.get_card(c1)
    hand.get_card(c2)
    hand.get_card(c3)
    hand.get_card(c4)
    expect(hand.four_of_kind?(hand.get_easy_reader)).to eq(true)
  end

  it "can detect a two pair" do
    c1 = Card.new(7, :clubs)
    c2 = Card.new(7, :diamonds)
    c3 = Card.new(10, :spades)
    c4 = Card.new(10, :hearts)
    c5 = Card.new(9, :hearts)
    hand.get_card(c1)
    hand.get_card(c2)
    hand.get_card(c3)
    hand.get_card(c4)
    hand.get_card(c5)
    expect(hand.two_pair?(hand.get_easy_reader)).to eq(true)
  end
  
  it "can detect a full house" do
    c1 = Card.new(7, :clubs)
    c2 = Card.new(7, :diamonds)
    c3 = Card.new(10, :spades)
    c4 = Card.new(10, :hearts)
    c5 = Card.new(10, :clubs)
    hand.get_card(c1)
    hand.get_card(c2)
    hand.get_card(c3)
    hand.get_card(c4)
    hand.get_card(c5)
    expect(hand.full_house?(hand.get_easy_reader)).to eq(true)
  end

  it "can detect a straight" do
    c1 = Card.new(7, :clubs)
    c2 = Card.new(8, :diamonds)
    c3 = Card.new(9, :spades)
    c4 = Card.new(10, :hearts)
    c5 = Card.new(11, :clubs)
    hand.get_card(c1)
    hand.get_card(c2)
    hand.get_card(c3)
    hand.get_card(c4)
    hand.get_card(c5)
    expect(hand.straight?(hand.get_easy_reader)).to eq(true)
  end
  
  it "can detect a flush" do
    c1 = Card.new(7, :clubs)
    c2 = Card.new(8, :clubs)
    c3 = Card.new(9, :clubs)
    c4 = Card.new(10, :clubs)
    c5 = Card.new(11, :clubs)
    hand.get_card(c1)
    hand.get_card(c2)
    hand.get_card(c3)
    hand.get_card(c4)
    hand.get_card(c5)
    expect(hand.flush?(hand.get_easy_reader)).to eq(true)
  end
  
  it "can detect a straight flush" do
    c1 = Card.new(7, :clubs)
    c2 = Card.new(8, :clubs)
    c3 = Card.new(9, :clubs)
    c4 = Card.new(10, :clubs)
    c5 = Card.new(11, :clubs)
    hand.get_card(c1)
    hand.get_card(c2)
    hand.get_card(c3)
    hand.get_card(c4)
    hand.get_card(c5)
    expect(hand.straight_flush?(hand.get_easy_reader)).to eq(true)
  end

  it 'can find the highest card' do
    c1 = Card.new(7, :clubs)
    c2 = Card.new(8, :clubs)
    c3 = Card.new(9, :clubs)
    c4 = Card.new(10, :clubs)
    c5 = Card.new(12, :heart)
    hand.get_card(c1)
    hand.get_card(c2)
    hand.get_card(c3)
    hand.get_card(c4)
    hand.get_card(c5)
    expect(hand.high_card).to eq(c5)
  end

end


