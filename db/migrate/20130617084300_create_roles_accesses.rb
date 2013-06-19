class CreateRolesAccesses < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS roles_accesses (
  id int(11) NOT NULL AUTO_INCREMENT,
  role_id int(11) DEFAULT '0',
  access_id int(11) DEFAULT '0',
  is_allowed tinyint(1) DEFAULT '0',
  PRIMARY KEY (id)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=551 ;
SQL
  end

  def down
    execute <<SQL
DROP TABLE if EXISTS  roles_accesses
SQL
  end
end
