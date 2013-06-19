class CreateTableJobRoles < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS job_roles (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  slug varchar(255) NOT NULL,
  aliases_level_id int(11) DEFAULT '0',
  organisation_id int(11) NOT NULL,
  product_id int(11) NOT NULL,
  on_which_step int(11) NOT NULL,
  is_completed tinyint(1) DEFAULT '0',
  expiry_date date DEFAULT '0000-00-00',
  can_delete tinyint(1) DEFAULT '1',
  is_deleted tinyint(1) DEFAULT '0',
  invite_later_date datetime NOT NULL,
  is_invited tinyint(1) DEFAULT '0',
  modified datetime NOT NULL,
  created datetime NOT NULL,
  PRIMARY KEY (id),
  KEY aliases_level_id (aliases_level_id),
  KEY organisation_id (organisation_id),
  KEY product_id (product_id),
  FOREIGN KEY (aliases_level_id) REFERENCES aliases_levels (id) ON DELETE CASCADE,
  FOREIGN KEY (organisation_id) REFERENCES organisations (id) ON DELETE CASCADE,
  FOREIGN KEY (product_id) REFERENCES products (id) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=111 ;
SQL

  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS job_roles
SQL
  end
end
