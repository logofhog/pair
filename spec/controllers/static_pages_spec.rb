require 'spec_helper'

describe StaticPagesController do

  before do
    @user = FactoryGirl.create :user
    sign_in @user
  end

  it 'should work' do
    get 'index'
    expect(response).to be_success
  end

  it 'current user is correct' do
    get 'index'
    expect(assigns(:current_user)).to eq(@user)
  end


end
