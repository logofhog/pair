require 'spec_helper'

describe User do

  it 'can have a person' do
    user = FactoryGirl.create :user
    person = FactoryGirl.create :person
    user.person = person
    expect(user.person).to eq(person)
  end

end
