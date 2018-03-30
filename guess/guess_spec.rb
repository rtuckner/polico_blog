require_relative "guess"
describe "GuessingGame" do
  describe "#evaluate_guess" do
    it "returns the cold message if the guess is 4 or more away from secret" do
      expect(GuessingGame.new(secret: 1).evaluate_guess(5)).to eq("you're cold")
    end
    it "return the luke warm message if guess is 3 away from secret" do
      expect(GuessingGame.new(secret: 1).evaluate_guess(4)).to eq("you're luke warm")
    end
    it "return the regular hot message if guess is 2 away from secret" do
      expect(GuessingGame.new(secret: 1).evaluate_guess(3)).to eq("you're regular hot")
    end
    it "return the real hot message if guess is 1 away from secret" do
      expect(GuessingGame.new(secret: 1).evaluate_guess(2)).to eq("you're real hot")
    end
  end

  describe "#num_guesses" do
    it "tells player they guessed the secret in one guess" do
      expect(GuessingGame.new(num_guesses: 1).counts_guesses).to eq("you got it in one guess")
    end
    it "tells player they guessed the secret in more than one guess" do
      expect(GuessingGame.new(num_guesses: 2).counts_guesses).to eq("you got it in 2 guesses")
    end
    it "has many many guesses" do
      expect(GuessingGame.new(num_guesses: 2000).counts_guesses).to eq("you got it in 2000 guesses")
    end
  end

  describe "#change_secret" do
    it "doesn't change secret because it's already 1" do
      game = GuessingGame.new(secret:1)
      expect(game.change_secret(2, rand_func: ->{ 2 })).to eq(false)
      expect(game.instance_variable_get(:@secret)).to eq(1)
    end
    it "reduces secret by one because guess is wrong" do
      game = GuessingGame.new(secret: 3)
      expect(game.change_secret(2, rand_func: ->{ 2 })).to eq(false)
      expect(game.instance_variable_get(:@secret)).to eq(2)
    end
    it "reduces secret by four because guess is wrong" do
      game = GuessingGame.new(secret: 10)
      expect(game.change_secret(8, rand_func: ->{ 5 })).to eq(false)
      expect(game.instance_variable_get(:@secret)).to eq(6)
    end
    it "doesn't change secret because it's already 10" do
      game = GuessingGame.new(secret: 10)
      expect(game.change_secret(4, rand_func: ->{ 0 })).to eq(false)
      expect(game.instance_variable_get(:@secret)).to eq(10)
    end
    it "secret changes to one to stay within the bounds" do
      game = GuessingGame.new(secret: 2)
      expect(game.change_secret(5, rand_func: ->{ 2 })).to eq(false)
      expect(game.instance_variable_get(:@secret)).to eq(1)
    end
  end
end
