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

  it 'returns 22 with a strike followed by two threes' do
    game = Bowling.new 'X33----------------'
    expect(game.score).to eq(22)
  end

  it 'returns 30 with a strike followed by a spare' do
    game = Bowling.new 'X3/----------------'
    expect(game.score).to eq(30)
  end
end
