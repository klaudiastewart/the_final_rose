require 'rails_helper'

RSpec.describe "Bachelorette's Contestant Show Page" do
  before(:each) do
    @bachelorette = Bachelorette.create!(name: "Tiffany", season_number: 2)
    @contestant1 = @bachelorette.contestants.create!(name: "Ted", age: 26, hometown: "Dallas")
    @lunch = Outing.create!(name: "Lunch", location: "Beach", date: Time.now)
    @dinner = Outing.create!(name: "Dinner", location: "Field", date: Time.now)
    ContestantOuting.create!(contestant: @contestant1, outing: @lunch)
    ContestantOuting.create!(contestant: @contestant1, outing: @dinner)

    visit "/bachelorettes/#{@bachelorette.id}/contestants/#{@contestant1.id}"
  end

  it 'shows contestants name and season number with description and their outings' do
    expect(page).to have_content(@contestant1.name)
    expect(page).to have_content(@bachelorette.season_number)
    expect(page).to have_content(@lunch.name)
    expect(page).to have_content(@dinner.name)
    expect(page).to have_link(@lunch.name)
    expect(page).to have_link(@dinner.name)
  end

  it 'can click an outing and that goes to that outings show page' do
    click_link (@lunch.name)
    expect(current_path).to eq("/bachelorettes/#{@bachelorette.id}/contestants/#{@contestant1.id}/outings/#{@lunch.id}")
  end
end
