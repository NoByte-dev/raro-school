class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.string :name, null: false, limit: 30
      t.integer :age, null: false
      t.integer :gender, null: true
      t.text :bio, null: true, limit: 500
      t.string :cpf, null: false, limit: 11, check: 'char_length(cpf) = 11'
      t.index :cpf, unique: true

      t.timestamps
    end
  end
end
