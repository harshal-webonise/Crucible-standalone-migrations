class CreateTableScenarios < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS scenarios (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary id of role_scenarios table',
  category_id int(11) NOT NULL COMMENT 'Primary key for behaviour/category table',
  title varchar(1000) NOT NULL COMMENT 'Title for ',
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id),
  KEY category_id (category_id),
  FOREIGN KEY (category_id) REFERENCES categories (id) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;
SQL
  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS scenarios
SQL
  end
end