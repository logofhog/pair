require 'spec_helper'

describe StaticPagesController do

  it 'should work' do
    get 'index'
    expect(response).to be_success
  end

  it 'current user is correct' do
    @user = FactoryGirl.create :user
    sign_in @user
    get 'index'
    expect(assigns(:current_user)).to eq(@user)
  end

end
