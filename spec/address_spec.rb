require('rspec')
require('address')

describe(Address) do
  before() do
    Address.clear()
  end

  describe("#street_address") do
    it("returns street_address of the contact") do
    test_address= Address.new ({:street_address=> "123 candy lane", :city => "Paris", :state => "OR", :zip => "55555", :type => "home"})
      expect(test_address.street_address()).to(eq("123 candy lane"))
      expect(test_address.city()).to(eq("Paris"))
      expect(test_address.state()).to(eq("OR"))
      expect(test_address.zip()).to(eq("55555"))
      expect(test_address.type()).to(eq("home"))
    end
  end
  describe('#id') do
    it("returns the id of the address") do
      test_address = Address.new({:street_address=> "123 candy lane", :city => "Paris", :state => "OR", :zip => "55555", :type => "home"})
      test_address.save()
      test_address2 = Address.new({:street_address=> "123 happy drive", :city => "Lululand", :state => "WA", :zip => "7777", :type => "vacation"})
        test_address2.save()
      expect(test_address.id()).to(eq(1))
      expect(test_address2.id()).to(eq(2))
    end
  end
  describe('.find') do
    it("returns address by its id") do
      test_address = Address.new({:street_address=> "123 candy lane", :city => "Paris", :state => "OR", :zip => "55555", :type => "home"})
      test_address.save()
      test_address2 = Address.new({:street_address=> "123 happy drive", :city => "Lululand", :state => "WA", :zip => "7777", :type => "vacation"})
      test_address2.save()
      expect(Address.find(test_address.id())).to(eq(test_address))
      expect(Address.find(test_address2.id())).to(eq(test_address2))
    end
  end
end
