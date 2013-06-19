class CreateTableTargets < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS targets (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT 'primary id',
  name varchar(255) DEFAULT NULL COMMENT 'name of the motivational score parameters',
  score int(11) DEFAULT NULL COMMENT 'score of the motivational score parameters',
  modified datetime NOT NULL,
  created datetime NOT NULL,
  class varchar(255) DEFAULT NULL COMMENT 'class assign to particular target is stored',
  PRIMARY KEY (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;
SQL
  end

  def down
    execute <<SQL
  DROP TABLE IF EXISTS targets
SQL

  end
end

