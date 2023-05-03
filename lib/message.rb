module Message
  def self.messages
    {
      intro_greeting: "Welcome to the Flash Card Game!\n" \
                      "Please enter your name to start\n",
      play_prompt:    "How many cards would you like?\n" \
                      "0 for random (Will Be Between 1-10)\n" \
                      "Negative numbers for list file\n",
      sec_break:      ('*' * 30),
      game_over:      "#{'*' * 9} Game over! #{'*' * 9}"
    }
  end
end
