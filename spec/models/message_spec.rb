require 'spec_helper'

describe Message do

  before do
    User.any_instance.stub(:zip_code_valid?).and_return(true)
    @sender = FactoryGirl.create :user
    @receiver = FactoryGirl.create :user, :email => 'example2@example.com'
    @message = Message.new(:subject => 'new message subject',
                          :body => 'new message body')
  end

  it 'allows messages' do
    @message.send_message(@sender, [@receiver])
    expect(@receiver.messages.first.body).to eq(@message.body)
   end

  it 'allows multiple receivers' do
    receiver2 = FactoryGirl.create :user, :email => 'example3@example.com'
    @message.send_message(@sender, [@receiver, receiver2])
    expect(receiver2.messages.received.first.body).to eq(@message.body)
  end

  it 'uses (no subject) for blank subject lines' do
    @no_subject_message = FactoryGirl.create :message, :subject => nil
    expect(@no_subject_message.subject).to eq('(No Subject)')
  end

  it 'requires subject or message' do
    @no_sub_or_body_message = FactoryGirl.build :message, 
                              :subject => nil, :body => nil
    @no_sub_or_body_message.valid?
    expect(@no_sub_or_body_message.errors).to have_key(:missing_data)
  end
end
