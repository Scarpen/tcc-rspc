class CreateUserHasAbilities < ActiveRecord::Migration
  def change
    create_table :abilities_users do |t|
      t.integer :user_id
      t.integer :ability_id

      t.timestamps null: false
    end
  end
end
