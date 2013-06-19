class CreateTableInstructions < ActiveRecord::Migration
  def up
    execute <<SQL
    CREATE TABLE IF NOT EXISTS instructions (
  id int(11) NOT NULL AUTO_INCREMENT,
  reference_id int(4) DEFAULT NULL,
  organisation_id int(11) DEFAULT '0',
  product_id int(11) DEFAULT '0',
  page_name varchar(255) NOT NULL,
  title varchar(255) DEFAULT NULL,
  body text,
  is_active tinyint(1) DEFAULT '0',
  slug varchar(255) NOT NULL DEFAULT '0',
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=104 ;
SQL
  end

  def down
    execute <<SQL
 DROP TABLE IF EXISTS instructions
SQL

  end
end

