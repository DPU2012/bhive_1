class CreateBdatabases < ActiveRecord::Migration
  def change
    create_table :bdatabases do |t|
      t.string :mtype
      t.string :msg

      t.timestamps
    end
  end
end
