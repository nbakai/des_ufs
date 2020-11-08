class AddVisitasToUfs < ActiveRecord::Migration[5.2]
  def change
    add_column :ufs, :visitas, :integer
  end
end
