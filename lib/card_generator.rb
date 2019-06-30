require './lib/card'

class CardGenerator
  attr_reader :user_file

  def initialize(user_file)
    @user_file = user_file
  end

  def cards
    card_file = File.readlines(user_file).collect do |line|
      new_card = line.chomp.split(",")
      Card.new(new_card[0], new_card[1], new_card[2].to_sym)
    end
  end
end
