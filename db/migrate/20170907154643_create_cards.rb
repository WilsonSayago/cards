class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :number
      t.string :cvv
      t.datetime :expirate_date

      t.timestamps null: false
    end
  end
end
