class InsertDefaultEntriesInSettings < ActiveRecord::Migration
  def up
    execute <<SQL
   INSERT INTO settings (id, organisation_id, product_id, name, value, original_file_name, type, created, modified) VALUES
(1, 0, 0, 'site title', 'Crucible', NULL, 0, now(), now()),
(2, 0, 0, 'meta titles', 'Crucible', NULL, 0, now(), now()),
(3, 0, 0, 'meta keywords', 'Crucible', NULL, 0, now(), now()),
(4, 0, 0, 'admin email', 'admin@crucible.com', NULL, 0, now(), now());
SQL
  end

  def down
  end
end
