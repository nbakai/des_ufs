class CreateArrendatarios < ActiveRecord::Migration[5.2]
  def change
    create_table :arrendatarios do |t|
      t.string :name
      t.integer :valor_arriendo
      t.integer :valor_total
      t.date :fecha_de_pago

      t.timestamps
    end
  end
end
