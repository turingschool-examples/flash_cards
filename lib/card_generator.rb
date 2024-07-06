# source https://www.writesoftwarewell.com/how-to-read-file-in-ruby/#:~:text=The%20simplest%20way%20to%20access,file%20%3D%20File.
require './lib/card.rb'

class CardGenerator

  def initialize(filename = "./lib/card.txt")

    File.foreach(filename) do |line| 
      # puts line
      cards_data = line.chomp.split(",")
      cards_data[2] = cards_data[2].to_sym
      puts cards_data[2].class
      card = Card.new(cards_data[0],cards_data[1],cards_data[2])
      p card
    end
  end

end

card_generator = CardGenerator.new