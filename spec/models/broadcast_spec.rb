require 'spec_helper'

describe Broadcast do
  it 'user has broadcasts' do
    @user = FactoryGirl.create :user
    @user.save
    @broadcast = FactoryGirl.create :broadcast
    @user.broadcasts << @broadcast
    expect(@user.broadcasts).to eq([@broadcast])
  end
end
