require 'spec_helper'

describe Person do

  context 'user has projects' do
    before do 
      @person = FactoryGirl.create :person
      @project = FactoryGirl.create :project
    end
    
    it 'allows user to have projects' do
      @person.projects << @project
      expect(@person.projects).to eq([@project])
    end

  end

  before do
    @person = FactoryGirl.create :person
  end

  it 'geocodes address' do
    expect(@person.latitude).to be_within(0.0001).of(33.944647)
    expect(@person.longitude).to be_within(0.0001).of(-84.3226488)
  end

  it 'fails validation' do
    @failing_person = Person.new(:name => 'fred')
    expect(@failing_person.valid?).to be false
  end

  it 'fails validates zip code' do
    @failing_person = Person.new(:name => 'failing fred', :zip_code => 1)
    expect(@failing_person.valid?).to be false
  end

  it 'validates zip code' do
    @passing_person = Person.new(:name => 'failing fred', :zip_code => 30338)
    expect(@passing_person.valid?).to be true
  end

  context 'has friends' do
    before do
      @person = FactoryGirl.create :person
      @friend = FactoryGirl.create :person
      @person.friends << @friend
    end

    it 'can have friends' do
      expect(@person.friends).to eq([@friend])
    end

    it 'can have inverse friends' do
      expect(@friend.inverse_friends).to eq([@person])
    end
  end
                                      
end
