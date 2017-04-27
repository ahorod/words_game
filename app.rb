require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/contact')
require('./lib/address')
require('./lib/phone_number')
require('pry')
require('launchy')

get('/') do
  @contacts = Contact.all()
  erb(:index)
end

get('/contacts') do
  @contacts = Contact.all()
  erb(:contacts)
end

get('/contacts/new') do
   erb(:contacts_form)
end

get('/contacts/:id') do
  @contact = Contact.find(params.fetch('id').to_i())
  erb(:contact)
end

post('/contacts') do
  # first_name = params.fetch('first_name')
  # last_name = params.fetch('last_name')
  # job_title = params.fetch('job_title')
  # company = params.fetch('company')
  # attributes = {:first_name=> first_name, :last_name => last_name, :job_title => job_title, :company => company}

new_contact = Contact.new(params)
new_contact.save()
  @contacts = Contact.all()
  erb(:contacts)
end

get('/contacts/:id/addresses/new') do
    @contact = Contact.find(params.fetch('id').to_i())
    erb(:address_form)
end

post('/addresses') do
  street_address = params.fetch('street_address')
  city = params.fetch('city')
  state = params.fetch('state')
  type = params.fetch('type')
  zip = params.fetch('zip')
  attributes = {:street_address=> street_address, :city => city, :state => state, :zip => zip, :type => type}

  @address = Address.new(attributes)
  @address.save()

  @contact = Contact.find(params.fetch('contact_id').to_i())

  @contact.add_address(@address)
  erb(:contact)
end

get('/contacts/:id/phone_numbers/new') do
    @contact = Contact.find(params.fetch('id').to_i())
    erb(:phone_form)
end

post('/phone_numbers') do
  area_code = params.fetch('area_code')
  number = params.fetch('number')
  type = params.fetch('type')
  attributes = {:area_code=> area_code, :number => number, :type => type}

  @phone_number = Phone_number.new(attributes)
  @phone_number.save()

  @contact = Contact.find(params.fetch('contact_id').to_i())

  @contact.add_phone_number(@phone_number)
  erb(:contact)
end
