require 'spec_helper'

describe StaticPagesController do

  before do
    User.any_instance.stub(:zip_code_valid?).and_return(true)
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

  context 'filters by interests' do

    before do
      @user.tag_list.add('rails')
      @user.save
      @user2 = FactoryGirl.create :user, :email => '212@example.com'
      @user2.tag_list.add('rails')
      @user2.save
      @user3 = FactoryGirl.create :user, :email => '21@example.com'
      @user3.tag_list.add('ruby')
      @user3.save
    end

    it 'filter turned on' do
      get 'index', {:interests => true}
      expect(assigns(:main_page).nearby).to eq([@user2])
    end

    it 'filter turned off' do
      get 'index'
      expect(assigns(:main_page).nearby.size).to eq(2)
    end

  end


end
