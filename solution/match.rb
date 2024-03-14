class Match

  def initialize(player1, player2)
    @players = { player1 => 0, player2 => 0 }
    @game_scores = { player1 => 0, player2 => 0 }
  end
  
  def point_goes_to(player)
    @players[player] += 1
    check_winner
  end

  def score
    if is_any_player_won?
      print_game_scores
    else
      current_score
    end
  end

  def current_score
    @players.map { |_k_, points| [0, 15, 30, 40].fetch(points, 40) }.join("-")
  end

  def check_winner
    top_scoring_player, top_score = @players.max_by { |_k_, point| point }
    if top_score >= 4 && (top_score - @players.values.min) >= 2
      @game_scores[top_scoring_player] += 1
      @players.transform_values! { 0 }
    end
  end

  def is_any_player_won?
    @game_scores.values.any? { |score| score > 0 }
  end

  def print_game_scores
    @game_scores.each do|_k,_v|
      p "#{_k}==>#{v}"
    end
  end


end


match = Match.new('x', 'y')
p match.inspect

p match.point_goes_to('x')
p match.score
p match.point_goes_to('y')
p match.score
p match.point_goes_to('x')
p match.score
p match.point_goes_to('x')
p match.score
p match.point_goes_to('x')
p match.score