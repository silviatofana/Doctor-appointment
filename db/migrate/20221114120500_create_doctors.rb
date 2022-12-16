class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :bio
      t.string :specialization
      t.string :avaliability 

      t.timestamps
    end
  end
end
