describe Bowling, "#score" do
  it 'returns 0 for all gutterball' do
    game = Bowling.new '--------------------'
    expect(game.score).to eq(0)
  end

  it 'returns 20 for all ones' do
    game = Bowling.new '11111111111111111111'
    expect(game.score).to eq(20)
  end

  it 'returns 19 with a spare followed by two threes' do
    game = Bowling.new '5/33----------------'
    expect(game.score).to eq(19)
  end
end