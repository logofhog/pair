require 'spec_helper'

describe User do

  context 'user has projects' do
    before do 
      @user = FactoryGirl.create :user, :email => 'example3@example.com'
      @project = FactoryGirl.create :project
    end
    
    it 'allows user to have projects' do
      @user.projects << @project
      expect(@user.projects).to eq([@project])
    end

  end

  context do

    before do
      @user = FactoryGirl.create :user
    end

    it 'geocodes address' do
      expect(@user.latitude).to be_within(0.0001).of(33.944647)
      expect(@user.longitude).to be_within(0.0001).of(-84.3226488)
    end

    it 'fails validation' do
      @failing_user = User.new(:name => 'fred')
      expect(@failing_user.valid?).to be false
    end

    it 'fails validates zip code' do
      @failing_user = User.new(:name => 'failing fred', :zip_code => 1)
      expect(@failing_user.valid?).to be false
    end

    it 'validates zip code' do
      @passing_user = FactoryGirl.create :user, :name => 'fred', :zip_code => 30338, :email => 'test3@test.com'
      expect(@passing_user.valid?).to be true
    end
  end 

  context 'has friends' do
    before do
      @user = FactoryGirl.create :user, :email => 'example2@example.com'
      @friend = FactoryGirl.build(:user, :email => 'test@test.com')
      @user.friends << @friend
    end

    it 'can have friends' do
      expect(@user.friends).to eq([@friend])
    end

    it 'can have inverse friends' do
      expect(@friend.inverse_friends).to eq([@user])
    end
  end

  context 'acts as taggable'
    before do
      @user = FactoryGirl.create :user, :email => 'taggable@example.com'
    end

    it 'is taggable' do
      @user.tag_list.add('rails')
      expect(@user.tag_list).to eq(['rails'])
    end
      
end
