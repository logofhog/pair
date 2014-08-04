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

end
