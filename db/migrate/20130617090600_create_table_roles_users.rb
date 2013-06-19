class CreateTableRolesUsers < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS roles_users (
  id int(11) NOT NULL AUTO_INCREMENT,
  role_id int(11) NOT NULL,
  user_id int(11) NOT NULL,
  modified datetime NOT NULL,
  created datetime NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY role_id (role_id,user_id),
  KEY user_id (user_id) ,
  FOREIGN KEY (role_id) REFERENCES roles (id) ON DELETE CASCADE,
   FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=239 ;
SQL
  end

  def down
    execute <<SQL
 DROP TABLE IF EXISTS  roles_users
SQL
  end
end
