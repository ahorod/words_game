require('rspec')
require('word')

describe(Word) do
  before() do
    Word.clear()
  end

  describe("#name") do
      it("returns name of the word") do
      test_word= Word.new ("Love")
        expect(test_word.name()).to(eq("Love"))
      end
    end
  describe('#id') do
    it("returns the id of the word") do
      test_word = Word.new("Love")
      test_word.save()
      test_word2 = Word.new("Sky")
      test_word2.save()
      expect(test_word.id()).to(eq(1))
      expect(test_word2.id()).to(eq(2))
    end
  end
  describe('.find') do
    it("returns word by its id") do
      test_word = Word.new("Love")
      test_word.save()
      test_word2 = Word.new("Sky")
      test_word2.save()
      expect(Word.find(test_word.id())).to(eq(test_word))
      expect(Word.find(test_word2.id())).to(eq(test_word2))
    end
  end
  describe('#add_definition') do
    it("adds a new definition to a word") do
      test_word = Word.new("Love")
      test_definition = Definition.new("an intense feeling of deep affection.")
      test_word.add_definition(test_definition)
      expect(test_word.definitions()).to(eq([test_definition]))
    end
  end

end
