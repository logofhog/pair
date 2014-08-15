require 'spec_helper'

describe Broadcast do
  before do 
    User.any_instance.stub(:zip_code_valid?).and_return(true)
    @user = FactoryGirl.create :user
    @user.save
  end

  it 'user has broadcasts' do
    @broadcast = FactoryGirl.create :broadcast
    @user.broadcasts << @broadcast
    expect(@user.broadcasts).to eq([@broadcast])
  end

  it 'doesnt allow blank broadcasts' do
    @broadcast = @user.broadcasts.new(:message=> '')
    expect(@broadcast).to have(1).errors_on(:message)
  end

  it 'enforces broadcast length limit' do
    too_long_message = 'x' * 256
    @too_long_broadcast = FactoryGirl.build :broadcast,
                            :message => too_long_message
    @too_long_broadcast.valid?
    expect(@too_long_broadcast.errors).to have_key(:message_too_long)

  end

end
