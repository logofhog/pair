require 'spec_helper'

describe Message do

  before do
    @sender = FactoryGirl.create :person
    @receiver = FactoryGirl.create :person
    @message = Message.new(:subject => 'new message subject',
                          :body => 'new message body')
  end

  it 'allows messages' do
    @message.send_message(@sender, [@receiver])
    expect(@receiver.messages.first.body).to eq(@message.body)
   end

  it 'allows multiple receivers' do
    receiver2 = FactoryGirl.create :person
    @message.send_message(@sender, [@receiver, receiver2])
    puts Message.all.inspect
    expect(receiver2.messages.received.first.body).to eq(@message.body)
  end
end
