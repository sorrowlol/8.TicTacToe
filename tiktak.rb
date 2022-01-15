# frozen_string_literal: true

class TicTacToe
  def initialize
    $board = Array.new(9, ' ')
  end

  def display_board
    puts " #{$board[0]} | #{$board[1]} | #{$board[2]} "
    puts '---|---|---'
    puts " #{$board[3]} | #{$board[4]} | #{$board[5]} "
    puts '---|---|---'
    puts " #{$board[6]} | #{$board[7]} | #{$board[8]} "
  end

  @@turn = 0

  def start
    if x_win
      puts 'Player X wins!'
      display_board
      return 'GAME OVER!'

    elsif o_win
      puts 'Player O wins!'
      display_board
      return 'GAME OVER'
    end

    display_board

    @@turn += 1

    puts "player #{player}: pick number between 1 - 9"

    choice
  end

  def choice
    @player_input = gets.chomp.to_i
    if @player_input < 1 || @player_input > 9
      puts 'pick number between 1 - 9'
      choice
    else
      valid_move
    end
  end

  def valid_move
    @player_input -= 1

    if $board[@player_input] == ' '
      $board[@player_input] = player
      start
    else
      puts 'place is taken. pick a new number'
      choice
    end
  end

  def player
    if @@turn.odd?
      'X'
    else
      'O'
    end
  end

  def x_win
    $xwin = $board[0] == 'X' && $board[1] == 'X' && $board[2] == 'X' ||
            $board[3] == 'X' && $board[4] == 'X' && $board[5] == 'X' ||
            $board[6] == 'X' && $board[7] == 'X' && $board[8] == 'X' ||
            $board[0] == 'X' && $board[3] == 'X' && $board[6] == 'X' ||
            $board[1] == 'X' && $board[4] == 'X' && $board[7] == 'X' ||
            $board[2] == 'X' && $board[5] == 'X' && $board[8] == 'X' ||
            $board[0] == 'X' && $board[4] == 'X' && $board[8] == 'X' ||
            $board[2] == 'X' && $board[4] == 'X' && $board[6] == 'X'
  end

  def o_win
    $owin = $board[0] == 'O' && $board[1] == 'O' && $board[2] == 'O' ||
            $board[3] == 'O' && $board[4] == 'O' && $board[5] == 'O' ||
            $board[6] == 'O' && $board[7] == 'O' && $board[8] == 'O' ||
            $board[0] == 'O' && $board[3] == 'O' && $board[6] == 'O' ||
            $board[1] == 'O' && $board[4] == 'O' && $board[7] == 'O' ||
            $board[2] == 'O' && $board[5] == 'O' && $board[8] == 'O' ||
            $board[0] == 'O' && $board[4] == 'O' && $board[8] == 'O' ||
            $board[2] == 'O' && $board[4] == 'O' && $board[6] == 'O'
  end
end

game = TicTacToe.new
game.start
