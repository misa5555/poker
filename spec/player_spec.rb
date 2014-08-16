require 'rspec'
require 'player'
require 'hand'

describe Player do
  subject(:player){Player.new(100, "Misa")}
  
  it 'has a name' do
    expect(player.name.class).to eq(String)
  end
  
  it "has a hand" do
    expect(player.hand.class).to eq(Hand) 
  end

  it "has a pot" do
    expect(player.pot.class).to eq(Fixnum)
    expect(player.pot).to be >= 0
  end
  
  it 'can recieve cards to give to the hand' do
    card = Card.new(8, :clubs)
    player.deal(card)
    expect(player.hand.num_cards).to eq(1)
  end
  
  ####middle methods user input?????
  
  it "can get the numerical value of the hand" do
    expect(player.hand_reveal.class).to eq(Fixnum)
  end
 
  
end