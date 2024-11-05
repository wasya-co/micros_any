
class User
  include Mongoid::Document
  include Mongoid::Timestamps

  ## Database authenticatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  ## Confirmable
  field :confirmation_token,   type: String
  field :confirmed_at,         type: Time
  field :confirmation_sent_at, type: Time
  field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  field :locked_at,       type: Time


  field :provider
  field :uid

  ## :confirmable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[ keycloakopenid ]

  def self.from_omniauth(auth)
    user = User.where( email: auth.info.email ).first
    if !user
      user = User.create({
        email: auth.info.email,
        confirmed_at: Time.now,
        provider: auth.provider,
        uid: auth.uid,
        password: Devise.friendly_token[0, 20],
      })
      # user.skip_confirmation!
    end
    user
  end

end
