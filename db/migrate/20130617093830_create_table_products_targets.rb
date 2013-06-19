class CreateTableProductsTargets < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS products_targets (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT 'primary id',
  alias varchar(255) DEFAULT NULL COMMENT 'alias name of motivational score parameters',
  organisation_id int(11) DEFAULT '0' COMMENT 'primary id of organisations table',
  product_id int(11) DEFAULT '0' COMMENT 'primary id of products table',
  target_id int(11) DEFAULT '0' COMMENT 'primary id of targets table',
  modified datetime NOT NULL,
  created datetime NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;
SQL

  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS products_targets
SQL
  end
end
