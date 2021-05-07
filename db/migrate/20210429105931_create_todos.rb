class CreateTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :todos do |t|
      t.string :name       ## string <256 chars
      t.text :description  ## text unlimited chars
      #t.timestamps        ## automatic created_at and updated_at fields
    end
  end
end
