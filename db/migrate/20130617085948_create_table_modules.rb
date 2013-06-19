class CreateTableModules < ActiveRecord::Migration
  def up
    execute <<SQL

CREATE TABLE IF NOT EXISTS modules (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(255) DEFAULT NULL,
  parent_id int(11) NOT NULL,
  slug varchar(255) DEFAULT NULL,
  product_id int(11) DEFAULT '0',
  modified datetime NOT NULL,
  created datetime NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=147 ;
SQL
  end

  def down
    execute <<SQL
 DROP TABLE IF EXISTS modules
SQL

  end
end

