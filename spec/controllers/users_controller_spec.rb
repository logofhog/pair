require 'spec_helper'

describe UsersController do
  before do
    @user = FactoryGirl.create :user
  end

  it 'shows user' do
    get 'show', {:id => @user.id, :format => 'js'}
    expect(response).to be_success
  end

  it 'about is editable' do
    sign_in @user
    patch 'update', :id => @user.id, :user => {:about => 'updated about'}
    @user.reload
    expect(@user.about).to eq('updated about')
  end

  context 'invalid credentials' do
    subject {patch 'update', :id => @user2.id,
             :user => {:about => 'updated about'}}
    
    it 'is only editable by correct user' do
      @user2 = FactoryGirl.create :user, :email => 'email@example.com'
      expect(subject).to redirect_to root_path
    end
  end

end
