require 'rails_helper'

RSpec.describe "Bachelorette's Contestant Index Page" do
  before(:each) do
    @bachelorette = Bachelorette.create!(name: "Tiffany", season_number: 2)
    @contestant1 = @bachelorette.contestants.create!(name: "Ted", age: 26, hometown: "Dallas")
    @contestant2 = @bachelorette.contestants.create!(name: "Ryan", age: 31, hometown: "Las Angeles")
    visit "/bachelorettes/#{@bachelorette.id}/contestants"
  end

  it 'shows contestants attributes' do
    expect(page).to have_content(@contestant1.name)
    expect(page).to have_content(@contestant2.name)
    expect(page).to have_content(@contestant1.age)
    expect(page).to have_content(@contestant2.age)
    expect(page).to have_content(@contestant1.hometown)
    expect(page).to have_content(@contestant2.hometown)
    expect(page).to have_link(@contestant1.name)
    expect(page).to have_link(@contestant2.name)
  end

  it 'can click a contestants name to go to their show page' do
    click_link "#{@contestant1.name}"
    expect(current_path).to eq("/bachelorettes/#{@bachelorette.id}/contestants/#{@contestant1.id}")
  end
end
