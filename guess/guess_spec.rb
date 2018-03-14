require_relative "guess"

describe "#evaluate_guess" do
  it "returns the cold message if the guess is cold" do
    expect(evaluate_guess(1, 10)).to eq("you're cold")
  end
  it "return the luke warm message if guess is luke warm" do
    expect(evaluate_guess(1,4)).to eq("you're luke warm")
  end
  it "return the regular hot message if guess is regular hot" do
    expect(evaluate_guess(1,3)).to eq("you're regular hot")
  end
  it "return the real hot message if guess is real hot" do
    expect(evaluate_guess(1,2)).to eq("you're real hot")
  end
end

describe "#count_guesses" do
  it "has one guess" do
    expect(counts_guesses(1)).to eq("you got it in one guess")
  end
  it "has more than one guess" do
    expect(counts_guesses(2)).to eq("you got it in 2 guesses")
  end
  it "has many many guesses" do
    expect(counts_guesses(2000)).to eq("you got it in 2000 guesses")
  end
end

describe "#change_secret" do
  it "doesn't change secret even though guess is wrong" do
    expect(change_secret(1,2,1, rand_func: ->{ 1 })).to eq([false, 2])
  end
  it "reduces secret by one because guess is wrong" do
    expect(change_secret(0,1,1, rand_func: ->{ 0 })).to eq([false, 2])
  end
  it "reduces secret by four because guess is wrong" do
    expect(change_secret(9,10,1, rand_func: ->{ 5 })).to eq([false, 6])
  end
  it "secret doesn't change because it's already 1" do
    expect(change_secret(3,1,1, rand_func: ->{ 2 })).to eq([false, 1])
  end
  it "secret changes to ten to stay within the bounds" do
    expect(change_secret(4,10,1, rand_func: ->{ 0 })).to eq([false, 10])
  end
  it "secret changes to one to stay within the bounds" do
    expect(change_secret(5,2,1, rand_func: ->{ 2 })).to eq([false, 1])
  end
end
