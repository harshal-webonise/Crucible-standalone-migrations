class CreateRoles < ActiveRecord::Migration
  def up
    execute <<SQL
   --
-- Table structure for table roles
--

CREATE TABLE IF NOT EXISTS roles (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  slug varchar(255) NOT NULL,
  is_active tinyint(1) DEFAULT '0',
  is_deleted tinyint(1) DEFAULT '0',
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------
SQL
  end

  def down
    execute <<SQL
DROP TABLE if EXISTS  roles
SQL
  end
end
