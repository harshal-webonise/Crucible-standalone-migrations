class CreateTableDaOrganisationsProducts < ActiveRecord::Migration
  def up
    execute <<SQL
 CREATE TABLE IF NOT EXISTS da_organisations_products (
  id int(11) NOT NULL AUTO_INCREMENT,
  product_id int(11) DEFAULT '0',
  organisation_id int(11) DEFAULT '0',
  category_id int(11) DEFAULT '0',
  name varchar(255) NOT NULL,
  slug varchar(255) NOT NULL,
  modified datetime NOT NULL,
  created datetime NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY product_id (product_id,organisation_id,category_id),
  KEY organisation_id (organisation_id),
  KEY category_id (category_id),
  FOREIGN KEY (product_id) REFERENCES products (id) ON DELETE CASCADE,
  FOREIGN KEY (organisation_id) REFERENCES organisations (id) ON DELETE CASCADE,
  FOREIGN KEY (category_id) REFERENCES categories (id) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=83 ;

-- --------------------------------------------------------
SQL
  end

  def down
    execute <<SQL
  DROP TABLE IF EXISTS da_organisations_products
SQL

  end
end
