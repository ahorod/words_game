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
  # describe('#add_definition') do
  #   it("adds a new definition to a word") do
  #     test_word = Word.new({:name=> "Love"})
  #     test_definition = Definition.new({:street_address=> "123 candy lane", :city => "Paris", :state => "OR", :zip => "55555", :type => "home"})
  #     test_contact.add_address(test_address)
  #     expect(test_contact.address()).to(eq([test_address]))
  #   end
  # end
  # describe('#add_phone_number') do
  #   it("adds a new phone_number to a contact") do
  #     test_contact = Contact.new({:first_name=> "Bob", :last_name => "Jane", :job_title => "bartender", :company => "4L"})
  #     test_phone_number = Phone_number.new ({:area_code=> "426", :number => "0000000", :type => "cell"})
  #     test_contact.add_phone_number(test_phone_number)
  #     test_phone_number2 = Phone_number.new ({:area_code=> "426", :number => "1000000", :type => "cell"})
  #     test_contact.add_phone_number(test_phone_number2)
  #     expect(test_contact.phone_number()).to(eq([test_phone_number, test_phone_number2 ]))
  #   end
  # end
end
