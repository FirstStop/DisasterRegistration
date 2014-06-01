class UuidForPerson < ActiveRecord::Migration
  def change
    add_column :people, :uuid, :string
    add_index :people, :uuid
  end
end
