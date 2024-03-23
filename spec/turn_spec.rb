require './lib/turn.rb'

RSpec.configure do |config|
      config.formatter = :documentation
end

RSpec.describe Turn do
  xit 'exists' do
    turn = Turn.new("Juneau", card)

    expect(turn).to be_instance_of(Turn)
  end

  it 'has a guess' do
    turn = Turn.new("Juneau", card)

    expect(turn.guess).to eq("")
  end

end
