require 'spec_helper'

describe TagsController do

  include Devise::TestHelpers

  before do
    @user = FactoryGirl.create :user
    @user.save
    sign_in @user
  end

  describe 'POST create' do

    it 'should work' do
      post :create, :tag => 'rails'
      expect(@user.tag_list).to eq(['rails'])
    end

    it 'allows multiple tags in request' do
      post :create, :tag => 'red, blue, green'
      expect(@user.tag_list).to eq(['red, blue, green'])
    end
  end

  describe 'DELETE destroy' do
    before do
      @user.tag_list.add("python, ruby, go", parse: true)
      @user.save
    end

    it 'removes tags' do
      delete :destroy, :id=> 'ruby'
      @user.reload
      expect(@user.tag_list).to eq(['python', 'go'])
    end
  end
end


