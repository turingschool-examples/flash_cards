require './lib/turn'

RSpec.describe Turn do
  it 'exists' do
    turn = Turn.new()

    expect(turn).to be_instance_of(Turn)
  end

end