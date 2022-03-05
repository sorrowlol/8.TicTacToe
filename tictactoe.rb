# frozen_string_literal: true

# game class for tictactoe
class TicTacToe
  # stops when reached
  WINNING_COMBOS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
    [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]
  ].freeze

  def initialize
    @board = Array.new(9, nil)
    @turn = 0
    start_game
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts '--+--+--'
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts '--+--+--'
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  # pick names and starts game
  def start_game
    puts 'Welcome to TicTacToe!'

    puts 'Player A name:'
    @player_a_name = gets.chomp
    puts 'Player B name:'
    @player_b_name = gets.chomp

    puts "#{@player_a_name} will be crosses ('X') and #{@player_b_name} will be circles ('O')!"
    puts 'Crosses go first! Pick a number between 1 and 9. 1 being the top-left and 9 being the bottom right.'

    turn
  end

  # get current_player
  def player_name
    @current_player = if @turn.odd?
                        @player_a_name
                      else
                        @player_b_name
                      end
  end

  # method for counting game turns
  def turn
    @turn += 1
    player_name
    puts "Turn: #{@current_player}"
    display_board
    move
  end

  # method for picking grid position
  def move
    @grid = gets.chomp.to_i
    while @grid < 1 || @grid > 9
      puts 'Number must be between 1 and 9'
      @grid = gets.chomp.to_i
    end
    valid_move?
    player
  end

  # method to check if grid position is taken
  def valid_move?
    return true if @board[@grid - 1].nil?

    false
  end

  # method to assign player X or player O to grid position
  def player
    if valid_move?
      @board[@grid - 1] = if @turn.odd?
                            '0'
                          else
                            'X'
                          end
      p @board
      win?
      if win?
        puts "#{@current_player} wins!"
      else
        turn
      end
    else
      puts 'That grid has been taken, choose another one'
      move
    end
  end

  def win?
    game_over = false
    WINNING_COMBOS.any? do |i|
      if [@board[i[0]], @board[i[1]], @board[i[2]]].uniq.length == 1 && !@board[i[0]].nil?
        game_over = true
        @winner = @board[i[0]]
        return game_over
      end
    end
    game_over
  end
end

game = TicTacToe.new
