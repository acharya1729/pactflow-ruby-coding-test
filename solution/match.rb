class Match

  def initialize(player1, player2)
    #initilize the player when start the match and increase the value if the point goes to the player 
    @players = { player1 => 0, player2 => 0 }

    #game score its increase the player value if won the set
    @game_scores = { player1 => 0, player2 => 0 }
  end
  
  # if player score a point this method increase the value 
  def point_goes_to(player)
    @players[player] += 1
    check_winner
    p score
  end

  def score
    if is_any_player_won?
      print_game_scores
    elsif is_deuce?
       "#{print_game_scores} Deuce !!"
    elsif is_advantage?
      "Advantage goes to !! #{advantage_goes_to_player}"
    else
      "#{print_game_scores} #{current_score}"
    end
  end

  private 

  #any point of time if you want to check the score of the set  
  def current_score
    @players.map { |_k_, points| [0, 15, 30, 40].fetch(points, 40) }.join("-")
  end

  #check the winner of the set and if any score 4 points with the diffreance of 2 point or without deuce increase the game score and transform the @players to {0}
  def check_winner
    top_scoring_player, top_score = @players.max_by { |_k_, point| point }
    if top_score >= 4 && (top_score - @players.values.min) >= 2
      @game_scores[top_scoring_player] += 1
      @players.transform_values! { 0 }
    end
  end

  #return true if any player won 
  def is_any_player_won?
    @game_scores.values.any? { |score| score > 0 }
  end

  # print the game score
  def print_game_scores
    @game_scores.values.join("-")
  end

  #deuce => if both players have same points 4-4
  def is_deuce?
    @players.values.all? { |score| score >=3 } and @players.values.uniq.size.eql? 1
  end

  #check advantage 
  def is_advantage?
    @players.values.any? { |score| score >= 4 } && @players.values.uniq.size > 1
  end

  #player who got Advantage 
  def advantage_goes_to_player
    @players.max_by { |_, score| score }.first
  end

end


# match = Match.new('x', 'y')

# p match.point_goes_to('x')
# p match.score
# p match.point_goes_to('x')
# p match.score
# p match.point_goes_to('x')
# p match.score
# p match.point_goes_to('y')
# p match.score
# p match.point_goes_to('y')
# p match.score
# p match.point_goes_to('y')
# p match.score
# p match.point_goes_to('y')
# p match.score
# p match.point_goes_to('y')
# p match.score
# p match.point_goes_to('y')
# p match.score