class CreateTableCoreThemes < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS core_themes (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary id of core  theme',
  name varchar(255) NOT NULL COMMENT 'Name of core  theme',
  description text NOT NULL COMMENT 'Description of core  theme',
  is_active tinyint(1) DEFAULT '0' COMMENT 'to check the status is active or not',
  modified datetime NOT NULL,
  created datetime NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY name (name)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;
SQL
  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS core_themes
SQL
  end
end