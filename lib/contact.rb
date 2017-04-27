class Contact
   @@contacts = []

  attr_accessor(:first_name, :last_name, :job_title, :company, :address, :phone_number)
  attr_reader(:id)

  define_method(:initialize) do |attributes|
    @first_name = (attributes.fetch(:first_name)).capitalize()
    @last_name = (attributes.fetch(:last_name)).capitalize()
    @job_title = attributes.fetch(:job_title)
    @company = attributes.fetch(:company)
    @id = @@contacts.length().+(1)
    @address = []
    @phone_number = []
  end


  define_singleton_method(:all) do
    @@contacts
  end

  define_method(:save) do
    @@contacts.push(self)
  end

  define_singleton_method(:clear) do
    @@contacts = []
  end

  define_singleton_method(:find) do |id|
    found_contact = nil
    @@contacts.each() do |contact|
      if contact.id().eql?(id)
        found_contact = contact
      end
    end
    found_contact
  end

  define_method(:add_address) do |address|
  @address.push(address)
  end

  define_method(:add_phone_number) do |phone_number|
  @phone_number.push(phone_number)
  end

end
