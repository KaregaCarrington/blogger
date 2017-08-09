class AddUuidToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :uuid, :string
  end
end
