class CreateRallies < ActiveRecord::Migration
  def change
    create_table :rallies do |t|

      t.timestamps null: false
    end
  end
end
