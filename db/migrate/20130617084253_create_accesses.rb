class CreateAccesses < ActiveRecord::Migration
  def up
    execute <<SQL

CREATE TABLE IF NOT EXISTS accesses (
  id int(11) NOT NULL AUTO_INCREMENT,
  plugin varchar(255) DEFAULT NULL,
  controller varchar(255) DEFAULT NULL,
  action varchar(255) DEFAULT NULL,
  module_id int(11) DEFAULT '0',
  modified datetime NOT NULL,
  created datetime NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=231 ;


SQL
  end

  def down
execute <<SQL
DROP TABLE if EXISTS  accesses
SQL
  end
end
