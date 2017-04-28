require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('./lib/definition')


get('/') do
  @words = Word.all()
  erb(:index)
end

# get('/words') do
#   @words = Word.all()
#   erb(:words)
# end

get('/words/new') do
   erb(:words_form)
end

get('/words/:id') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:word)
end

post('/words') do
  name = params.fetch('name')
  Word.new(name).save()
  @words = Word.all()
  erb(:index)
end

get('/words/:id/definitions/new') do
    @word = Word.find(params.fetch('id').to_i())
    erb(:definition_form)
end

post('/definitions') do
  meaning = params.fetch('meaning')
  @definition = Definition.new(meaning)
  @definition.save()

  @word = Word.find(params.fetch('word_id').to_i())

  @word.add_definition(@definition)
  erb(:word)
end
