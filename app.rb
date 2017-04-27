require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/contacts')
require('./lib/address')
require('./lib/phone_number')

get('/') do
  erb(:index)
end

get('/contacts/new') do
   erb(:contacts_form)
end

get('/contacts') do
  @contact = Contact.all()
  erb(:contacts)
end

post('/contacts') do
  # first_name = params.fetch('first_name')
  # last_name = params.fetch('last_name')
  # job_title = params.fetch('job_title')
  # company = params.fetch('company')
  # attributes = {'first_name '=> first_name, 'last_name' => last_name, 'job_title' => job_title, 'company' => company}

  attributes = attributes.values_at('first_name', 'last_name', 'job_title','company')
  Contact.new(attributes).save()
  @contacts = Contact.all()
  erb(:contacts)
end

# get('/vehicles/:id') do
#   @vehicle = Vehicle.find(params.fetch('id').to_i())
#   erb(:vehicle)
# end
#
# get('/dealerships/:id') do
#   @dealership = Dealership.find(params.fetch('id').to_i())
#   erb(:dealership)
# end
#
# get('/dealerships/:id/vehicles/new') do
#     @dealership = Dealership.find(params.fetch('id').to_i())
#     erb(:dealership_vehicles_form)
# end
#
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
