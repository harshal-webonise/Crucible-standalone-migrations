class CreateTableOrganisationsProductsParameters < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS organisations_products_parameters (
  id int(11) NOT NULL AUTO_INCREMENT,
  product_id int(11) DEFAULT '0',
  organisation_id int(11) DEFAULT '0',
  total_responses int(2) DEFAULT '0',
  type int(1) DEFAULT '0',
  modified datetime NOT NULL,
  created datetime NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY product_id (product_id,organisation_id),
  KEY organisation_id (organisation_id),
  FOREIGN KEY (product_id) REFERENCES products (id) ON DELETE CASCADE,
   FOREIGN KEY (organisation_id) REFERENCES organisations (id) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------
SQL
  end

  def down
    execute <<SQL
  DROP TABLE IF EXISTS organisations_products_parameters
SQL

  end
end
