require 'rspec'
require 'card'
describe Card do
  subject(:card){ Card.new(5, :hearts) }
  
  it "card has value" do
    expect(card.value).to eq(5)
  end
  
  it "card has suit" do
    expect(card.suit).to eq(:hearts)
  end
  
  it "card knows its name" do
    expect(card.name).to eq("5 of hearts")
  end
  
  it "can describe named cards" do
    expect( Card.new(13, :hearts).name).to eq("King of hearts")
  end
end
