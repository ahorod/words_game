require('rspec')
require('definition')

describe(Definition) do
  before() do
    Definition.clear()
  end

  describe("#meaning") do
    it("returns meaning of the definition") do
    test_definition= Definition.new ("an intense feeling of deep affection.")
      expect(test_definition.meaning()).to(eq("an intense feeling of deep affection."))
    end
  end
  describe('#id') do
    it("returns the id of the definition") do
      test_definition= Definition.new ("an intense feeling of deep affection.")
      test_definition.save()
      test_definition2 = Definition.new ("a person or thing that one loves.")
      test_definition2.save()
      expect(test_definition.id()).to(eq(1))
      expect(test_definition2.id()).to(eq(2))
    end
  end
  describe('.find') do
    it("returns definition by its id") do
      test_definition= Definition.new ("an intense feeling of deep affection.")
      test_definition.save()
      test_definition2 = Definition.new ("a person or thing that one loves.")
      test_definition2.save()
      expect(Definition.find(test_definition.id())).to(eq(test_definition))
      expect(Definition.find(test_definition2.id())).to(eq(test_definition2))
    end
  end
end
