class User < ApplicationRecord
  before_create :create_uuid
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  def self.find_or_create_from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.image = auth.info.image  
    end    
  end


  private

  def create_uuid
    begin
      self.uuid = SecureRandom.uuid
    end while self.class.exists?(:uuid => uuid)
  end
end
