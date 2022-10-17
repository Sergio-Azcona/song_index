require 'rails_helper'
#when visit site see Artist Songs index
#display titles of all Artist's songs
#see hyperlink to that songs show page

RSpec.describe 'Artist Song Index' do
    
    # could not use let; when i pry in ArtistSongController songs = [] -why?
    # let(:prince)  { Artist.create!(name: 'Prince')}
    # let(:purple)  { prince.songs.create!(title: 'Pupple Rain', length: 845, play_count: 8599)}
    # let(:beret)  { prince.songs.create!(title: 'Raspberry Beret', length: 665, play_count: 99)}

  before(:each) do
    @prince = Artist.create!(name: 'Prince')
    @purple = @prince.songs.create!(title: 'Pupple Rain', length: 845, play_count: 8599)
    @beret = @prince.songs.create!(title: 'Raspberry Beret', length: 665, play_count: 99)
    @jgb = Artist.create!(name: 'Jerry Garcia Band')
    @aint_no = @jgb.songs.create!(title: 'Aint No Bread In The Breadbox', length: 540, play_count: 12000)
    @the_harder = @jgb.songs.create!(title: 'The Harder They Come', length: 240, play_count: 120000)
  end


  it 'shows all titles of songs for artist' do  
    visit "/artist/#{@prince.id}/songs"
    # save_and_open_page
    expect(page).to have_content(@purple.title)
    expect(page).to have_content(@beret.title)
    expect(page).not_to have_content(@aint_no.title)
  end
  
  it 'links to each song show page' do    
    visit "/artist/#{@prince.id}/songs"
    
    click_on @purple.title
    
    expect(current_path).to eq("/songs/#{@purple.id}")
    expect(current_path).not_to eq("/songs/#{@beret.id}")
    # save_and_open_page
  end
  
  it 'shows the average song length for artist' do
    # require 'pry';binding.pry
    visit "/artist/#{@prince.id}/songs"
    expect(page).to have_content("Average Song Length #{@prince.average_song_length}")
  end
end