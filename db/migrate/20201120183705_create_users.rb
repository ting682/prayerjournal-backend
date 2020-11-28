class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email_address
      t.string :password_digest
      t.string :name
      t.string :bio
      

      t.timestamps
    end
  end
end
