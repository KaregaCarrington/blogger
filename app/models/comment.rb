class Comment < ApplicationRecord
  before_create :create_uuid
  belongs_to :user
  belongs_to :post

    private

    def create_uuid
      begin
        self.uuid = SecureRandom.uuid
      end while self.class.exists?(:uuid => uuid)
    end

end
