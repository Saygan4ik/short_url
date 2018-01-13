class AddStatusToUrls < ActiveRecord::Migration[5.1]
  def change
    add_column :urls, :status, :integer, default: Url.statuses[:public_url]
  end
end
