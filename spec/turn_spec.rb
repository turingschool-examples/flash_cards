require './lib/turn'

require './lib/card'

RSpec.describe Turn do
  it 'exists' do 
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)

    turn = Turn.new("Saturn", card)

    expect(turn).to be_instance_of(Turn)
  end
end