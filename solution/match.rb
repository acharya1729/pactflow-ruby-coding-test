class Match

  def initialize(player1, player2)
    @players = { player1 => 0, player2 => 0 }
  end
  
  def point_goes_to(player)
    @players[player] += 1
  end

  def score
    current_score
  end


  def current_score
    @players.map { |_, points| [1, 15, 30, 40].fetch(points, 40) }.join("-")
  end

end


match = Match.new('x','y')
p match.inspect

p match.point_goes_to("x")
p match.score