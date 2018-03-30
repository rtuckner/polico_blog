require_relative "guess"

# --------- Main Program -----------------
loop do
  GuessingGame.new.run_game

  puts "play again?"
  answer = gets
  if answer =~ /^n/i
    break
  end
end
