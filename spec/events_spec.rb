require 'rails_helper'

feature "Events" do
  scenario 'User creates an event' do

    visit root_path
    click_on "New Event"
    fill_in "Location", with: "Union Square"
    fill_in "Description", with: "SantaCon"
    click_on "Create Event"

    expect(page).to have_content("Union Square")
    expect(page).to have_content("SantaCon")
  end
  scenario 'User edits an event' do
    Event.create!(
    description: "SantaCon",
    )

    visit root_path
    click_on "edit"
    fill_in "Location", with: "Union Square"
    click_on "Update Event"

    expect(page).to have_content("Union Square")
  end
  scenario "listing events" do
    Event.create!(
      description: "free lunch today",
    )

    Event.create!(
    description: "Ramen festival",
    )

    Event.create!(
    description: "Hug Momo Hour",
    )

    visit root_path

    expect(page).to have_content("free lunch")
    expect(page).to have_content("Hug Momo Hour")
    expect(page).to have_content("Ramen festival")
  end
  scenario 'User deletes an event' do
    Event.create!(
    description: "SantaCon",
    location: "Union Square",
    )

    visit root_path
    click_on "delete"

    expect(page).to have_no_content("SantaCon")
    expect(page.current_path).to eq(events_path)
  end
end
