class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable, omniauth_providers: [:facebook, :twitter, :google_oauth2]

  has_many :leaves, dependent: :destroy, class_name: :Leave
  has_many :attendences, dependent: :destroy

  def get_attendence
    return self.attendences.where("attendence_date = ?", Date.today)
  end

  def self.find_for_twitter_oauth(auth, signed_in_resource = nil)
    user = User.where(provider: auth.provider, uid: auth.uid).first
    if user
      return user
    else
      registered_user = User.where(email: auth.uid + "@twitter.com").first
      if registered_user
        return registered_user
      else
        user = User.create(
                          name: auth.extra.raw_info.name,
                          provider: auth.provider,
                          uid: auth.uid,
                          email: auth.uid+"@twitter.com",
                          password: Devise.friendly_token[0,20],
                          role: "Employee"
                          )
      end
    end
  end

  def self.find_for_facebook_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
      user.role = "Employee"
    end
  end

  def self.find_for_google_oauth(auth_hash)
    user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
    user.email = auth_hash['info']['email']
    user.password = Devise.friendly_token[0,20]
    user.name = auth_hash['info']['name']
    user.role = "Employee"
    user.save!
    user
  end

  def get_monthly_attendence(date = Date.today )
    Hash[self.attendences.where(attendence_date:
      date.beginning_of_month..date.end_of_month).pluck(:attendence_date, :attendence)]
  end
end
