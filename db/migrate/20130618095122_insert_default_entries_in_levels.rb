class InsertDefaultEntriesInLevels < ActiveRecord::Migration
  def up
execute <<SQL
INSERT INTO levels (id, name, parent_id, lft, rght, slug, created, modified) VALUES
(1, 'Business Unit', NULL, 1, 2, 'business_unit', now(), now()),
(2, 'Division', NULL, 3, 4, 'division', now(), now()),
(3, 'Channel', NULL, 5, 6, 'channel', now(), now()),
(4, 'Function', NULL, 7, 8, 'function', now(), now()),
(5, 'Country', NULL, 9, 10, 'country', now(), now()),
(6, 'Region', NULL, 11, 12, 'region', now(), now()),
(7, 'Area', NULL, 13, 14, 'area', now(), now()),
(8, 'Site', NULL, 15, 16, 'site', now(), now())
SQL
  end

  def down
  end
end
