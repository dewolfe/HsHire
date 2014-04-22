require 'spec_helper'

describe ProfilesController do
  before (:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end
  describe "Get #show" do

    it "renders the :show template" do
      get :show, id: @user.profile.id
      response.should .should render_template('show')
    end
  end
end
