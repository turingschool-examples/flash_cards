class CardGenerator
  file = File.open("cards.txt", "r")

  incoming_flashcards = file.read
end
