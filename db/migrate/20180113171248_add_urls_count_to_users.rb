class AddUrlsCountToUsers < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.integer :urls_count, default: 0
    end

    reversible do |dir|
      dir.up { data }
    end
  end

  def data
    execute <<-SQL.squish
        UPDATE users
           SET urls_count = (SELECT count(1)
                                   FROM urls
                                  WHERE urls.user_id = users.id)
    SQL
  end
end

