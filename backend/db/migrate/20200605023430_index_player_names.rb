class IndexPlayerNames < ActiveRecord::Migration[6.0]
  # An index can be created concurrently only outside of a transaction.
  disable_ddl_transaction!

  def change
    add_index :players, :name, opclass: :gin_trgm_ops, using: :gin
  end
end
