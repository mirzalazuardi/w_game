class WordGame
  attr_reader :words
  def initialize(words)
    @words = words
  end

  def shuffle_word
    words[rand(words_count)]
  end

  def shuffle_character(word)
    word.chars.shuffle.join
  end

  private

  def words_count
    words.count
  end
end
