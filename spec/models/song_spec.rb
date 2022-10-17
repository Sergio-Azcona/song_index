require 'rails_helper'

RSpec.describe Song, type: :model do #specifying type model optional as it is already in a models folder
  it {should belong_to :artist}
  it {should_not belong_to :songs}
end