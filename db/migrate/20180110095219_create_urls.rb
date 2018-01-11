class CreateUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :urls do |t|
      t.belongs_to :user, index: true
      t.string :initial_url, null: false
      t.string :short_url, null: false

      t.timestamps
    end
  end
end
