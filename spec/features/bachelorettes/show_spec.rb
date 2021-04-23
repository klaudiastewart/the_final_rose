require 'rails_helper'

RSpec.describe "Bachelorette Show Page" do
  before(:each) do
    @bachelorette = Bachelorette.create!(name: "Tiffany", season_number: 2)
    @contestant1 = @bachelorette.contestants.create!(name: "Ted", age: 26, hometown: "Dallas")
    @contestant2 = @bachelorette.contestants.create!(name: "Ryan", age: 31, hometown: "Las Angeles")
    visit "/bachelorettes/#{@bachelorette.id}"
  end

  it 'shows the bachelorettes attributes' do
    expect(page).to have_content(@bachelorette.name)
    expect(page).to have_content(@bachelorette.season_number)
  end

  it 'has a link to the bachelorettes contestants that I can click on' do
    expect(page).to have_link("#{@bachelorette.name}'s Contestants")
    click_link ("#{@bachelorette.name}'s Contestants")
    expect(current_path).to eq("/bachelorettes/#{@bachelorette.id}/contestants")
    expect(page).to have_content(@contestant1.name)
    expect(page).to have_content(@contestant2.name)
  end
end
