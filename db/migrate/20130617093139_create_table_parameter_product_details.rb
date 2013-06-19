class CreateTableParameterProductDetails < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS parameter_product_details (
  id int(11) NOT NULL AUTO_INCREMENT,
  organisations_products_parameter_id int(11) DEFAULT '0',
  name varchar(255) NOT NULL,
  scale_starts int(2) DEFAULT '0',
  scale_ends int(2) DEFAULT '0',
  modified datetime NOT NULL,
  created datetime NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY organisations_products_parameter_id (organisations_products_parameter_id,name),
  FOREIGN KEY (organisations_products_parameter_id)
  REFERENCES organisations_products_parameters (id) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=48 ;
SQL
  end

  def down
    execute <<SQL
  DROP TABLE IF EXISTS parameter_product_details
SQL

  end
end
