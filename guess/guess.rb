#
# @param secret - the secret number being guessed
# @param guess -  the user's guess
# @return - the message that is displayed to the user
#
def evaluate_guess(secret, guess)
  case (secret-guess).abs
  when 1
    s = "real hot"
  when 2
    s = "regular hot"
  when 3
    s = "luke warm"
  else
    s = "cold"
  end
  "you're #{s}"
end

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
      puts evaluate_guess(secret, guess)
      secret = secret + 1 - rand(3)
    end
  end
end
