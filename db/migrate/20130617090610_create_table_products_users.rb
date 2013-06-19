class CreateTableProductsUsers < ActiveRecord::Migration
  def up
    execute <<SQL

CREATE TABLE IF NOT EXISTS products_users (
  id int(11) NOT NULL AUTO_INCREMENT,
  product_id int(11) NOT NULL,
  user_id int(11) NOT NULL,
  role_id int(11) NOT NULL,
  is_psa tinyint(1) DEFAULT '0',
  is_accepted tinyint(1) DEFAULT '0',
  hash varchar(255) DEFAULT NULL,
  is_active tinyint(1) DEFAULT '0',
  show_instruction tinyint(1) DEFAULT '0',
  modified datetime NOT NULL,
  created datetime NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY product_id (product_id,user_id,role_id),
  KEY products_users_ibfk_3 (role_id),
  KEY products_users_ibfk_5 (user_id),
  FOREIGN KEY (product_id) REFERENCES products (id) ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
  FOREIGN KEY (role_id) REFERENCES roles (id) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2033 ;
SQL
  end

  def down
    execute <<SQL
 DROP TABLE IF EXISTS  products_users
SQL
  end
end
