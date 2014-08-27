require 'spec_helper'

describe BroadcastList do

  before do
    User.any_instance.stub(:zip_code_valid?).and_return(true)
    @user = FactoryGirl.create :user
    @test_user = FactoryGirl.create(:user, :email => 'test_user@example.com')
    @broadcast = FactoryGirl.create :broadcast
    @test_user.broadcasts << @broadcast
    @test_user.save
  end
  
  it 'should return broadcasts' do
    broadcasts = BroadcastList.new({:current_user => @user}).broadcasts
    expect(broadcasts).to eq([@broadcast])
  end

  it 'should paginate' do
    30.times do 
      broadcast = FactoryGirl.create :broadcast
      @test_user.broadcasts << broadcast
    end
    broadcasts = BroadcastList.new({:current_user => @user, :page => 1}).broadcasts
    expect(broadcasts.size).to eq(11)
  end

end



