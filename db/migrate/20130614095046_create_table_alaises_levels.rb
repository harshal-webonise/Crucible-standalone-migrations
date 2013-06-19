class CreateTableAlaisesLevels < ActiveRecord::Migration
  def up
  execute <<-SQL
 --
-- Table structure for table aliases_levels
--

CREATE TABLE IF NOT EXISTS aliases_levels (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  level_id int(11) NOT NULL,
  parent_id int(11) DEFAULT NULL,
  organisation_id int(11) NOT NULL,
  lft int(11) DEFAULT NULL,
  rght int(11) DEFAULT NULL,
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY level_id (level_id,parent_id,organisation_id),
  KEY organisation_id (organisation_id),
 FOREIGN KEY (level_id) REFERENCES levels (id) ON DELETE CASCADE,
   FOREIGN KEY (organisation_id) REFERENCES organisations (id) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=124 ;

-- --------------------------------------------------------
  SQL
  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS aliases_levels
SQL
  end
end
