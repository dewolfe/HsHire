require 'spec_helper'
require 'carrierwave/test/matchers'
describe Profile do
  before (:each) do
    @user = FactoryGirl.create(:user)
    @profile=@user.create_profile
  end
  it "should allow user to unload an avatar to s3" do
    @uploader = AvatarUploader.new(@user, :avatar)
    @uploader.store!(File.open('/home/dewolfe/Dropbox/test.jpg'))


  end

end


