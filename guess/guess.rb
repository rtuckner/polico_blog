class GuessingGame
  def initialize(secret: rand(10) + 1, num_guesses: 0)
    @secret = secret
    @num_guesses = num_guesses
  end

  #
  # @param secret - the secret number being guessed
  # @param guess -  the user's guess
  # @return - the message that is displayed to the user
  #
  def evaluate_guess(guess)
    case (@secret-guess).abs
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

  def counts_guesses
    if @num_guesses == 1
      return "you got it in one guess"
    else
      return "you got it in #{@num_guesses} guesses"
    end
  end

  #
  # guess - the user's guess
  # secret - the game secret
  # num_guesses - the number of guesses that the user has made
  # rand_func - the function to generate a random number to modify secret by
  # returns - array
  #   first - true if break, false if not
  #   second - the new secret
  #
  def change_secret (guess, rand_func: ->{ rand(3) })
    if guess == @secret
      puts(counts_guesses)
      return true
    else
      puts evaluate_guess(guess)
      @secret = @secret + 1 - rand_func.call
      if @secret < 1
        @secret = 1
      elsif @secret > 10
        @secret = 10
      end
      return false
    end
  end

  def run_game
    loop do
      print "enter a number from 1 to 10: "
      guess = gets.to_i

      should_break = change_secret(guess)
      break if should_break

      @num_guesses = @num_guesses + 1
    end
  end
end
