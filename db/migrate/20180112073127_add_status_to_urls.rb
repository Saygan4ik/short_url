class AddStatusToUrls < ActiveRecord::Migration[5.1]
  def change
    add_column :urls, :status, :string, null: false
  end
end
