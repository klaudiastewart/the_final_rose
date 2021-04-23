require 'rails_helper'

RSpec.describe "Bachelorette's Contestant Show Page" do
  before(:each) do
    @bachelorette = Bachelorette.create!(name: "Tiffany", season_number: 2)
    @contestant1 = @bachelorette.contestants.create!(name: "Ted", age: 26, hometown: "Dallas")
    @contestant2 = @bachelorette.contestants.create!(name: "Ryan", age: 31, hometown: "Austin")
    @lunch = Outing.create!(name: "Lunch", location: "Beach", date: Time.now)
    ContestantOuting.create!(contestant: @contestant1, outing: @lunch)
    ContestantOuting.create!(contestant: @contestant2, outing: @lunch)

    visit "/bachelorettes/#{@bachelorette.id}/contestants/#{@contestant1.id}/outings/#{@lunch.id}"
  end

  it 'shows the outings attributes' do
    expect(page).to have_content(@lunch.name)
    expect(page).to have_content(@lunch.location)
    expect(page).to have_content(@lunch.date)
    expect(page).to have_content(@contestant1.name)
    expect(page).to have_content(@contestant2.name)
    expect(page).to have_content(@lunch.contestants.count)
  end
end
