class AddIndexToUrls < ActiveRecord::Migration[5.1]
  def change
    add_index :urls, :short_url
  end
end
