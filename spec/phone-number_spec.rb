require('rspec')
require('phone_number')

describe(Phone_number) do
  before() do
    Phone_number.clear()
  end

  describe("#phone_number") do
    it("returns parameters of phone number") do
    test_phone_number = Phone_number.new ({:area_code=> "426", :number => "0000000", :type => "cell"})
      expect(test_phone_number.area_code()).to(eq("426"))
      expect(test_phone_number.number()).to(eq("0000000"))
      expect(test_phone_number.type()).to(eq("cell"))
    end
  end
  describe('#id') do
    it("returns the id of the phone number") do
      test_phone_number = Phone_number.new ({:area_code=> "426", :number => "0000000", :type => "cell"})
      test_phone_number.save()
      test_phone_number2 = Phone_number.new ({:area_code=> "426", :number => "1000000", :type => "home"})
      test_phone_number2 .save()
      expect(test_phone_number.id()).to(eq(1))
      expect(test_phone_number2.id()).to(eq(2))
    end
  end
  describe('.find') do
    it("returns phone number by its id") do
      test_phone_number = Phone_number.new ({:area_code=> "426", :number => "0000000", :type => "cell"})
      test_phone_number.save()
      test_phone_number2 = Phone_number.new ({:area_code=> "426", :number => "1000000", :type => "home"})
      test_phone_number2 .save()
      expect(Phone_number.find(test_phone_number.id())).to(eq(test_phone_number))
      expect(Phone_number.find(test_phone_number2.id())).to(eq(test_phone_number2))
    end
  end
end
