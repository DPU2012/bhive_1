class CreateMsgs < ActiveRecord::Migration
  def change
    create_table :msgs do |t|
      t.text :msg
      t.string :msgtype

      t.timestamps
    end
  end
end
