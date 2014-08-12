require 'spec_helper'

describe BroadcastsController do
  before do
    @user = FactoryGirl.create :user
    @user2 = FactoryGirl.create :user, :email => 'ex@example.com'
    @user2.broadcasts << FactoryGirl.create(:broadcast)
    @user2.broadcasts << FactoryGirl.create(:broadcast)
    sign_in @user
  end

 it 'shows nearby broadcasts' do
   get 'index'
   assigns(:broadcasts).first.should eq(@user2.broadcasts.first)
 end

 it 'shows nearby broadcasts' do
   get 'index'
   assigns(:broadcasts).count.should eq(2)
 end


end
