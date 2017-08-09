class Post < ApplicationRecord
  before_create :create_uuid
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :user_id, presence: true
  validates :body, presence: true
  validates :title, presence: true
  default_scope -> { order(created_at: :desc) }

  private

  def create_uuid
    begin
      self.uuid = SecureRandom.uuid
    end while self.class.exists?(:uuid => uuid)
  end
  
end
