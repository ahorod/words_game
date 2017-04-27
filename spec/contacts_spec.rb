require('rspec')
require('contact')

describe(Contact) do
  before() do
    Contact.clear()
  end

  describe("#first_name") do
      it("returns first_name of th contact") do
      test_contact= Contact.new ({:first_name=> "Bob", :last_name => "Jane", :job_title => "bartender", :company => "4L"})
        expect(test_contact.first_name()).to(eq("Bob"))
      end
    end
  describe('#last_name') do
    it("returns the last_name of the contact") do
    test_contact = Contact.new({:first_name=> "Bob", :last_name => "Jane", :job_title => "bartender", :company => "4L"})
    expect(test_contact.last_name()).to(eq("Jane"))
    end
  end
  describe('#job_title') do
  it("returns the job_title of the contact") do
    test_contact = Contact.new({:first_name=> "Bob", :last_name => "Jane", :job_title => "bartender", :company => "4L"})
    expect(test_contact.job_title()).to(eq("bartender"))
    end
  end
  describe('#company') do
  it("returns the company of the contact") do
    test_contact = Contact.new({:first_name=> "Bob", :last_name => "Jane", :job_title => "bartender", :company => "4L"})
    expect(test_contact.company()).to(eq("4L"))
    end
  end
  describe('#id') do
    it("returns the id of the contact") do
      test_contact = Contact.new({:first_name=> "Bob", :last_name => "Jane", :job_title => "bartender", :company => "4L"})
      test_contact.save()
      test_contact2 = Contact.new({:first_name=> "Larry", :last_name => "Spinelli", :job_title => "Manager", :company => "Target"})
        test_contact2.save()
      expect(test_contact.id()).to(eq(1))
      expect(test_contact2.id()).to(eq(2))
    end
  end
  describe('.find') do
    it("returns contact by its id") do
      test_contact = Contact.new({:first_name=> "Bob", :last_name => "Jane", :job_title => "bartender", :company => "4L"})
      test_contact.save()
      test_contact2 = Contact.new({:first_name=> "Larry", :last_name => "Spinelli", :job_title => "Manager", :company => "Target"})
        test_contact2.save()
      expect(Contact.find(test_contact.id())).to(eq(test_contact))
      expect(Contact.find(test_contact2.id())).to(eq(test_contact2))
    end
  end
  describe('#add_address') do
    it("adds a new address to a contact") do
      test_contact = Contact.new({:first_name=> "Bob", :last_name => "Jane", :job_title => "bartender", :company => "4L"})
      test_address = Address.new({:street_address=> "123 candy lane", :city => "Paris", :state => "OR", :zip => "55555", :type => "home"})
      test_contact.add_address(test_address)
      expect(test_contact.address()).to(eq([test_address]))
    end
  end
  describe('#add_phone_number') do
    it("adds a new phone_number to a contact") do
      test_contact = Contact.new({:first_name=> "Bob", :last_name => "Jane", :job_title => "bartender", :company => "4L"})
      test_phone_number = Phone_number.new ({:area_code=> "426", :number => "0000000", :type => "cell"})
      test_contact.add_phone_number(test_phone_number)
      test_phone_number2 = Phone_number.new ({:area_code=> "426", :number => "1000000", :type => "cell"})
      test_contact.add_phone_number(test_phone_number2)
      expect(test_contact.phone_number()).to(eq([test_phone_number, test_phone_number2 ]))
    end
  end
end
