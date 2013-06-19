class CreateTableCandidates < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS candidates (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  name varchar(255) NOT NULL COMMENT 'Name of candidate',
  email varchar(255) NOT NULL COMMENT 'Email of candidate',
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY email (email)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2215 ;
SQL
  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS candidates
SQL
  end
end
