class InsertDefaultEntriesInRoles < ActiveRecord::Migration
  def up
    execute <<SQL
INSERT INTO roles (id, name, slug, is_active, is_deleted, created, modified) VALUES
(1, 'Global Dashboard Super Admin', 'global_dashboard_super_admin', 1, 0, now(), now()),
(2, 'Global Dashboard Admin', 'global_dashboard_admin', 1, 0, now(), now()),
(3, 'Product Super Admin', 'product_super_admin', 1, 0, now(), now()),
(4, 'Product Admin', 'product_admin', 1, 0, now(), now()),
(5, 'Key Contact', 'key_contact', 1, 0, now(), now()),
(6, 'Normal User', 'normal_user', 1, 0, now(), now()),
(7, 'Manager', 'manager', 1, 0, now(), now()),
(8, 'Wgll User', 'wgll_user', 1, 0, now(), now());
SQL
  end

  def down
    execute <<SQL
/*TRUNCATE TABLE roles;*/
SQL
  end
end
