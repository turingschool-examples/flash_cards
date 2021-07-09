require_relative 'play_game'

class CardGenerator
  @cards = CardGenerator.new(filename).cards
  filename = "cards.txt"

  file = File.open(ARGV.first, "r")
end


require_relative 'enigma'

class Encrypt
  @enigma_machine = Enigma.new
  file = File.open(ARGV.first, "r")
  text = file.read.chomp
  result = @enigma_machine.encrypt(text)
  file_output = ARGV.last
  new_file = File.open(file_output, "w")
  new_file.write(result[:encryption])
  puts "Created #{file} with the key 82648 and date 240818"
end


# filename = "cards.txt"
# @cards = CardGenerator.new(filename).cards
# # @card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
# # @card_2 = Card.new('How long is the backend program at Turing?', '7 months', :Turing)
# # @card_3 = Card.new('What does FSD stand for? Hint: Pesto Paws!', 'Freedom Service Dogs', :Pesto)
# # @card_4 = Card.new('How long are the modules or innings at Turing?', '6 weeks', :Turing)
# # @card_5 = Card.new("Is it appropriate to greet or 'say hello' to Pesto when you meet him?", 'No', :Pesto)
# # @cards = [@card_1, @card_2, @card_3, @card_4, @card_5]
