require 'rspec/autorun'

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

RSpec.describe WordGame do
  subject { described_class.new(words) }
  let(:words) { %w[buku pulpen lampu kompas detik tissue] }
  let(:word) { 'buku' }

  describe '#shuffle_word' do
    it 'is show a word from list' do
      expect(words.include?(subject.shuffle_word)).to eq true
    end
  end

  describe '#shuffle_character' do
    it 'is show charaters of word randomly' do
      expect(subject.shuffle_character(word)).not_to eq word
    end
    it 'is contain character of specific word' do
      result = subject.shuffle_character(word)
      expect(result.index('b')).not_to eq nil
      expect(result.index('u')).not_to eq nil
      expect(result.index('k')).not_to eq nil
    end
  end
end
