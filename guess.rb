def run_game
  secret = rand(10)
  #secret = 1
  num_guesses = 0

  loop do
    print "enter a number from 1 to 10: "
    guess = gets.to_i
    num_guesses = num_guesses + 1

    if guess == secret
      if num_guesses == 1
        puts "you got it in one guess"
      else
        puts "you got it in #{num_guesses} guesses"
      end
      break
    else
      if (secret-guess).abs == 1
        puts "you're real hot"
      elsif (secret-guess).abs == 2
        puts "you're regular hot"
      elsif (secret-guess).abs == 3
        puts "you're luke warm"
      else
        puts "you're cold"
      end
      secret = secret + 1 - rand(3)
    end
  end
end

# --------- Main Program -----------------
loop do
  run_game

  puts "play again?"
  answer = gets
  if answer =~ /^n/i
    break
  end
end
