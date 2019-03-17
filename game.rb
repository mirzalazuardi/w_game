require_relative 'word_game'
require 'pry'
class Game
  attr_reader :log, :score, :game
  def initialize(game)
    @log   = {}
    @score = 0
    @game  = game
  end

  def new_word
    @new_word = game.shuffle_word
  end

  def question
    "Tebak kata: #{shuffle_character}"
  end

  def prompt
    puts question
    puts 'Jawab:'
    gets
  end

  def start
    @answer = prompt.strip
    calculate_score
    puts result
  end

  def result(result = "SALAH! Silakan coba lagi")
    result = "BENAR point anda #{@score}" if corrected?
  end

  def calculate_score
    (corrected?) ? @score += 1 : @score -= 1
  end

  def corrected?
   @answer == @new_word
  end

  def shuffle_character
    game.shuffle_character(new_word)
  end

end

play = Game.new(WordGame.new(%w(buku tulis meja)))
play.start
