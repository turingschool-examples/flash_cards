require './lib/card.rb'
require './lib/turn.rb'

RSpec.describe Turn do
  describe 'Turn exists' do
    turn = Turn.new("Saturn", card)

    expect(turn).to be_instance_of(Turn)
  end
end
