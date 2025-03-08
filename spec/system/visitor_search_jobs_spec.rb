require 'rails_helper'

describe "Visitor search for jobs", type: :system do
  it 'successfuly' do
    create(:job_posting, title: "RUBY on Rails Dev Jr.")
    create(:job_posting, title: "Sinatra Developer Jr.")
    create(:job_posting, title: "Sinatra Dev Pl.")
    create(:job_posting, title: "Rails Developer Pl.")
    create(:job_posting, title: "DragonRuby Game Dev Sr.")

    visit root_path
    fill_in "title", with: "ruby"
    find("#search_button").click

    expect(page).to have_content "RUBY on Rails Dev Jr."
    expect(page).to have_content "DragonRuby Game Dev Sr."
    expect(page).not_to have_content "Sinatra Developer Jr."
    expect(page).not_to have_content "Sinatra Dev Pl."
    expect(page).not_to have_content "Rails Developer Pl."
  end

  it 'and search empty' do
    create(:job_posting, title: "Ruby on Rails Dev Jr.")
    create(:job_posting, title: "Sinatra Developer Jr.")
    create(:job_posting, title: "Sinatra Dev Pl.")
    create(:job_posting, title: "Rails Developer Pl.")
    create(:job_posting, title: "DragonRuby Game Dev Sr.")

    visit root_path
    fill_in "title", with: ""
    find("#search_button").click

    expect(page).to have_content "Por favor, digite algum valor para a busca"
    expect(page).to have_content "Ruby on Rails Dev Jr."
    expect(page).to have_content "DragonRuby Game Dev Sr."
    expect(page).to have_content "Sinatra Developer Jr."
    expect(page).to have_content "Sinatra Dev Pl."
    expect(page).to have_content "Rails Developer Pl."
  end

  it 'and not found jobs' do
    create(:job_posting, title: "Ruby on Rails Dev Jr.")
    create(:job_posting, title: "Sinatra Developer Jr.")
    create(:job_posting, title: "Sinatra Dev Pl.")
    create(:job_posting, title: "Rails Developer Pl.")
    create(:job_posting, title: "DragonRuby Game Dev Sr.")

    visit root_path
    fill_in "title", with: "Node"
    find("#search_button").click

    expect(page).to have_content "Nenhuma vaga encontrada."
    expect(page).not_to have_content "Please enter a search term."
    expect(page).not_to have_content "Ruby on Rails Dev Jr."
    expect(page).not_to have_content "DragonRuby Game Dev Sr."
    expect(page).not_to have_content "Sinatra Developer Jr."
    expect(page).not_to have_content "Sinatra Dev Pl."
    expect(page).not_to have_content "Rails Developer Pl."
  end
end
