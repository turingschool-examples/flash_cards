require './lib/card'

class CardGenerator
  attr_reader :user_file

  def initialize(user_file)
    @user_file = user_file
  end

  def cards
    card_file = File.readlines(user_file).collect do |line|
      card = line.chomp.split(",")
      Card.new(card[0], card[1], card[2].to_sym)
    end
  end
end
