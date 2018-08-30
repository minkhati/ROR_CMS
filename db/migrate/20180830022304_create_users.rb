class CreateUsers < ActiveRecord::Migration[5.2]
  def up
    create_table :users do |t|
      t.string "first_name", :limit => 25
      t.column "last_name", :string, :limit => 25
      t.string "email", :default => '', :null => false
      t.string "password", :limit => 25
      t.timestamps

      # t.datetime "created_at"
      # t.datetime "updated_at"
    end
  end
  def down
    drop_table :users 
  end
end
