class CreateTableOrganisationsProducts < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS organisations_products (
  id int(11) NOT NULL AUTO_INCREMENT,
  organisation_id int(11) NOT NULL,
  product_id int(11) NOT NULL,
  logo varchar(255) DEFAULT NULL,
  background_color varchar(255) DEFAULT NULL,
  link_color varchar(255) DEFAULT NULL,
  highlight_color varchar(255) DEFAULT NULL,
  usage_limit int(11) DEFAULT NULL,
  is_active tinyint(1) DEFAULT '1',
  on_which_step int(11) NOT NULL DEFAULT '0',
  is_completed tinyint(1) DEFAULT '0',
  modified datetime NOT NULL,
  created datetime NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY organisation_id (organisation_id,product_id),
  KEY product_id (product_id),
  FOREIGN KEY (organisation_id) REFERENCES organisations (id) ON DELETE CASCADE,
   FOREIGN KEY (product_id) REFERENCES products (id) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

-- --------------------------------------------------------
SQL
  end

  def down
    execute <<SQL
  DROP TABLE IF EXISTS organisations_products
SQL

  end
end
