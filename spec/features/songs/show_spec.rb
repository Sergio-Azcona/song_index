require 'rails_helper'

RSpec.describe 'the songs show page' do
  it 'displays song title' do
    artist = Artist.create!(name: "Carly Rae")
    song = artist.songs.create!(title: "I Really Like You", length: 208, play_count: 2456357)
    song_2 = Song.create!(title: "Call Me Maybe", length: 207, play_count: 2156357, artist_id: artist.id) #variable to test

    visit "/songs/#{song.id}"

    expect(page).to have_content(song.title)
    expect(page).to_not have_content(song_2.title)
  end

  it 'displays the name of the artist for the song' do
    artist = Artist.create!(name: "Carly Rae")
    song = artist.songs.create!(title: "I Really Like You", length: 208, play_count: 2456357)
    song_2 = Song.create!(title: "Call Me Maybe", length: 207, play_count: 2156357, artist_id: artist.id) #variable to test

    visit "/songs/#{song.id}"
    save_and_open_page #capybara
    expect(page).to have_content(artist.name)
  end
end