require './lib/turn'
require './lib/card'

Rspec.describe Turn do
  it 'exists' do
    turn = Turn.new("Is it guess?", :card)

    expect(turn).to be_instance_of(Turn)
  end
end