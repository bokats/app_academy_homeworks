class AddReference < ActiveRecord::Migration
  def change
    drop_table :toys
  end
end
