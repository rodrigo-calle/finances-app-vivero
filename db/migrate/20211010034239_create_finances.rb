class CreateFinances < ActiveRecord::Migration[6.1]
  def change
    create_table :finances do |t|
      t.text :description
      t.string :amount 
      t.decimal :price      
      t.date :day
      t.belongs_to :category

      t.timestamps
    end
  end
end
