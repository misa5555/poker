require 'rspec'
require 'game'

describe Game do
  subject(:game){Game.new}  
  
  it "has a deck" do
    
  end
  
  it "gives all the players 5 cards at first" do
  end
  
  it "has at least two players (and less than six)" do
    expect(game.player.length).to be >= 2
    expect(game.player.length).to be <= 5
  end
  
  it "knows whose turn it is" do
    expect(game.current.nil?).to eq(false)
  end
  
  # not sure
  xit "ged rid of the player who folds" do
    player_count = game.current_players.length
    let(:samle_player){ double("sample_layer", :name=>"bob")}
    sample_player.folds
    expect(game.current_players.length).to eq(player_count-1)
  
  end  
  
  it "knows how much money there is in the pot" do
    expect(game.pot.class).to eq(Integer)
    expect(game.pot).to be >= 0
  end
  
  it "ends when all but one player folds" do
    4.times{game.players.sample.folds}
    expect(game.over?).to eq(true)
  end
  
  it "ends when cards are shown" do
    expect(game.over?).to eq(true)
  end    
  
end


