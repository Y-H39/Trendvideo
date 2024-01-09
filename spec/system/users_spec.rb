require 'rails_helper'

RSpec.describe 'User', type: :system do
  it 'shows greeting' do
    # root_pathへアクセス
    visit root_path
  end
end
