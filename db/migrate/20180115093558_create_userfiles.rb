class CreateUserfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :userfiles do |t|
      t.belongs_to :user, index: true
      t.string :file
      t.string :short_url, index: true
      t.timestamps
    end
  end
end
