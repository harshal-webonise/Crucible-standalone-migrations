class InsertDefaultEntriesInRolesUsers < ActiveRecord::Migration
  def up
  execute <<SQL
INSERT INTO roles_users (id, role_id, user_id, modified, created) VALUES
(1, 1, 1, now(), now());
SQL
  end

  def down
  end
end
