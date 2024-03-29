# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
    validates :username, :password_digest, :session_token, presence: true
    validates :password, length: {minimum: 6, allow_nil: true}

    attr_reader :password

    has_many :subs
    has_many :posts
   

    after_initialize :ensure_session_token

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        return nil unless user && user.is_password?(password)
        user
    end 

    def generate_session_token
        self.session_token = SecureRandom.urlsafe_base64(16)
        self.save
        self.session_token
    end 

    def reset_session_token!
        generate_session_token
    end 

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end 

    def password=(password)
        @password = password 
        self.password_digest = BCrypt::Password.create(password)

    end 

    private 
    def ensure_session_token
        self.session_token ||= SecureRandom.urlsafe_base64(16)
    end 
    
end
