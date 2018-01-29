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
