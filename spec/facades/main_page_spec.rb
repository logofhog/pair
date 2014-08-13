require 'spec_helper'

describe MainPage do

  before do
    @user = FactoryGirl.create :user
  end
   
  it 'shows no broadcasts if there are none' do
    main_page = MainPage.new({:current_user => @user})
    expect(main_page.broadcasts.first.message).to eq('There are no broadcasts in that area!')
  end

  context 'filters by interests' do
    before do 
      @user2 = FactoryGirl.create :user, :email => 'e@example.com'
      @user2.tag_list.add('rails')
      @user2.save
    end

    it 'has common interests' do
      main_page = MainPage.new({:current_user => @user, :interests => 'rails'})
      expect(main_page.nearby).to eq([@user2])
    end

    it 'has no common interests' do
      @user2.tag_list.remove('rails')
      @user2.save
      main_page = MainPage.new({:current_user => @user, :interests => 'rails'})
      expect(main_page.nearby).to eq([])
    end
  end

end


