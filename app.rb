require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/contact')
require('./lib/address')
require('./lib/phone_number')
require('pry')
require('launchy')

get('/') do
  erb(:index)
end

get('/contacts/new') do
   erb(:contacts_form)
end

get('/contacts') do
  @contacts = Contact.all()
  erb(:contacts)
end

post('/contacts') do
  first_name = params.fetch('first_name')
  last_name = params.fetch('last_name')
  job_title = params.fetch('job_title')
  company = params.fetch('company')
  attributes = {:first_name=> first_name, :last_name => last_name, :job_title => job_title, :company => company}

  Contact.new(attributes).save()
  @contacts = Contact.all()
  erb(:contacts)
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


get('/contacts/:id') do
  @contact = Contact.find(params.fetch('id').to_i())
  erb(:contact)
end

get('/contacts/:id/addresses/new') do
    @contact = Contact.find(params.fetch('id').to_i())
    erb(:address_form)
end

# post('/new') do
#   make = params.fetch('make')
#   model = params.fetch('model')
#   year = params.fetch('year')
#   @vehicle = Vehicle.new(make, model, year)
#   @vehicle.save()
#   @dealership = Dealership.find(params.fetch('dealership_id').to_i())
#   @dealership.add_vehicle(@vehicle)
#   erb(:success)
# end
#
# get('/vehicles/') do
#   @vehicles = Vehicle.all()
#   erb(:vehicles)
# end
#
# get('/dealership_vehicles_form/new') do
#   erb(:dealership_vehicles_form)
# end
