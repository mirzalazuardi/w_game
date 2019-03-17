require_relative 'word_game'
require 'pry'
class Game
  attr_reader :log, :score, :game
  def initialize(game)
    @log   = []
    @score = 0
    @game  = game
  end

  def new_word
    result = game.shuffle_word
    return stats if log.count == game.words.count
    return new_word if log.map{ |x| x[:word] }.include? result
    @new_word = result
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
    loop do
      @answer = prompt.strip
      calculate_score
      stats if @answer == 'quit'
      puts result
      @log << {word: @new_word, corrected: corrected?.to_s, score: @score}
    end
  end

  def stats
    puts '--stats--'
    @log.map do |log|
      puts log.values.join(', ')
    end
    exit
  end

  def result(result = "SALAH! Silakan coba lagi")
    result = "BENAR point anda #{@score}" if corrected?
    result
  end

  def calculate_score
     @score += 1 if corrected?
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
