class CreateTableLevels < ActiveRecord::Migration
  def up
  execute <<-SQL
--
-- Table structure for table levels
--

CREATE TABLE IF NOT EXISTS levels (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(255) DEFAULT NULL,
  parent_id int(11) DEFAULT NULL,
  lft int(11) DEFAULT NULL,
  rght int(11) DEFAULT NULL,
  slug varchar(255) DEFAULT NULL,
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY name (name)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=57 ;
  SQL
  end

  def down
    excute <<-SQL
 DROP TABLE IF EXISTS  clusters
    SQL

  end
end
