require 'spec_helper'

describe MainPage do
   
  it 'shows no broadcasts if there are none' do
    @user = FactoryGirl.create :user
    main_page = MainPage.new(@user)
    expect(main_page.broadcasts).to eq(['There are no broadcasts in that area!'])
  end
end


