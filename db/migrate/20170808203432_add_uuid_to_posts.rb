class AddUuidToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :uuid, :string
  end
end
