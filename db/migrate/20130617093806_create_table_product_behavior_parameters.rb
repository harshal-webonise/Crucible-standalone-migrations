class CreateTableProductBehaviorParameters < ActiveRecord::Migration
  def up
    execute <<SQL
  CREATE TABLE IF NOT EXISTS product_behavior_parameters (
  id int(11) NOT NULL AUTO_INCREMENT,
  product_id int(11) DEFAULT '0',
  organisation_id int(11) DEFAULT '0',
  no_of_questions int(11) DEFAULT '0',
  no_of_responses int(2) DEFAULT '0',
  is_active tinyint(1) DEFAULT '1',
  is_deleted tinyint(1) DEFAULT '0',
  modified datetime NOT NULL,
  created datetime NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY product_id (product_id,organisation_id),
  KEY organisation_id (organisation_id),
  FOREIGN KEY (product_id) REFERENCES products (id) ON DELETE CASCADE,
   FOREIGN KEY (organisation_id) REFERENCES organisations (id) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;
SQL

  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS product_behavior_parameters
SQL
  end
end
