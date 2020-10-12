class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :password_digest
      t.string :name
      t.string :email
      t.string :company

      t.timestamps
    end
  end
end
