#User class is responsible for creating user records 
class User < OmniAuth::Identity::Models::ActiveRecord
  # has_many :attendees
  # has_many :guests, through: :attendees
  # has_many :events, through: :attendees
  # has_many :teams, through: :attendees
  # has_many :contributions
  
  
 # has_secure_password
  has_many :authentications
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, :presence   => true,
            :format     => { :with => email_regex },
            :uniqueness => { :case_sensitive => false }
  
  def self.create_with_omniauth(auth)
    pass_gen = rand(36**10).to_s(36)
    auth_name = auth['info']['name']
    auth_email = auth['info']['email']

    case auth['provider']
    when 'facebook'
      create(name: auth_name, password: pass_gen, email: auth_email)
    when 'google_oauth2'
      create(name: auth_name, password: pass_gen, email: auth_email)
    when 'twitter'
      create(name: auth_name, password: pass_gen)
    else
      create(name: auth_name)
    end

  end
  
end