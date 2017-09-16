class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable

  has_many :runs, dependent: :destroy
  has_many :shoes, dependent: :destroy

  def self.find_user_by(value)
    where(["username = :value OR email = :value", {value: value}]).first
  end

  def send_login_link url
    generate_login_token

    UserMailer.login_link(self, url).deliver_later
  end

  def generate_login_token
    self.login_token = generate_token
    self.token_generated_at = Time.now.utc
    save!
  end

  def valid_token?(token)
    token && self.login_token && !login_token_expired?
  end

  def login_token_expired?
    Time.now.utc > (self.token_generated_at + token_validity)
  end

  def expire_token!
    self.login_token = nil
    save!
  end

  private

  def generate_token
    SecureRandom.hex(10)
  end

  def token_validity
    2.hours
  end
end
