describe Bowling, "#score" do
  it 'returns 0 for all gutterball' do
    game = Bowling.new '--------------------'
    expect(game.score).to eq(0)
  end
end
