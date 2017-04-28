require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
describe('word path', {:type => :feature}) do
  before() do
    Word.clear()
  end
  it('processes word and saves it') do
    visit('/words/new')
    fill_in('name', :with => 'Love')
    click_button('Add Word')
    expect(page).to have_content('Welcome Words Game
Words List Love')
  end

  it('processes word and definition saves it') do
    visit('/words/new')
    fill_in('name', :with => 'Love')
    click_button('Add Word')
    visit('/words/1/definitions/new')
    fill_in('meaning', :with => 'an intense feeling of deep affection.')
    click_button('Add Definition')
    expect(page).to have_content('Love
Definition:
an intense feeling of deep affection.
Add new definition
Return to Main Page')
  end
end
