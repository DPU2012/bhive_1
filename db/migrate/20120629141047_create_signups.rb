class CreateSignups < ActiveRecord::Migration
  def change
    create_table :signups do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :retype_email
      t.string :password
      t.string :retype_password
      t.string :sex
      t.string :birthday
      t.string :email2

      t.timestamps
    end
  end
end
