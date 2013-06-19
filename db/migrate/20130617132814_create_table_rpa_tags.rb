class CreateTableRpaTags < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS rpa_tags (
  id int(11) NOT NULL AUTO_INCREMENT,
  organisation_id int(11) NOT NULL DEFAULT '0',
  product_id int(11) NOT NULL DEFAULT '0',
  response_id int(11) NOT NULL DEFAULT '0',
  name varchar(255) NOT NULL,
  modified datetime NOT NULL,
  created datetime NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY organisation_id (organisation_id,product_id,response_id),
  KEY product_id (product_id),
  FOREIGN KEY (organisation_id) REFERENCES organisations (id) ON DELETE CASCADE ON UPDATE NO ACTION,
   FOREIGN KEY (product_id) REFERENCES products (id) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;
SQL
  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS rpa_tags
SQL
  end
end
