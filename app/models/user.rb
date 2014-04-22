class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable :registerable,
  devise :invitable, :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable,:omniauthable,
         :omniauth_providers => [:facebook]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:provider,:uid,:name,
                  :first_name,:last_name,:address,:address2,:city,:province,:postal,
                  :country,:avatar,:kids,:resume

  before_create :add_profile
  serialize :kids
  has_one :profile
  has_many :endorsements

  def full_name
    [first_name,last_name].join(" ")
  end

  def add_profile
    create_profile

  end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user=User.new
      #user = User.create(name:auth.extra.raw_info.name,
      #                   provider:auth.provider,
      #                   uid:auth.uid,
      #                   email:auth.info.email,
      #                   password:Devise.friendly_token[0,20]
      #)
      #set_flash_message(:notice=>"you suck")
     # redirect_to root_path
    end
    user
  end
  def apply_omniauth(auth)
    #self.email = omniauth['user_info']['email'] if email.blank?
    #authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])

    self.update(name:auth.extra.raw_info.name,
                first_name: auth.extra.raw_info.first_name,
                last_name: auth.extra.raw_info.last_name,
                provider:auth.provider,
                uid:auth.uid,
                avatar:auth.info.image,
                email:auth.info.email,
                password:Devise.friendly_token[0,20]
    )

    profile.remote_avatar_url="https://graph.facebook.com/#{auth.uid}/picture?width=150&height=150"
    profile.save!
  end
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
