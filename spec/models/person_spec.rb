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
    @person.zip_code = 30338
    @person.save
    puts @person.inspect
    expect(@person.latitude).to be_within(180).of(0)
    expect(@person.longitude).to be_within(180).of(0)
  end
                                      
end
