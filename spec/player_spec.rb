require 'rspec'
require 'player'
describe Player do
  subject(:player){Player.new}
  
  
  
  it "has a hand" do
    expect(player.hand.class).to eq.(hand.class) 
  end

  it "has a pot" do
    expect(player.pot.class).to eq.(Integer)
    expect(player.pot).to be >= 0
  end
  
  it "can discard" do
    
  end
  
  it "can fold" do
    
  end
  
  it "can raise" do
    
  end
  
  it "can see" do
    
  end
  
end