class CreateTablePages < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS pages (
  id int(11) NOT NULL AUTO_INCREMENT,
  reference_id int(4) DEFAULT NULL,
  organisation_id int(11) DEFAULT '0',
  product_id int(11) DEFAULT '0',
  language_id int(4) DEFAULT NULL,
  meta_keywords varchar(255) NOT NULL,
  meta_description varchar(255) NOT NULL,
  title varchar(50) NOT NULL,
  body text NOT NULL,
  is_active int(1) NOT NULL DEFAULT '0',
  slug varchar(255) NOT NULL DEFAULT '0',
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;
SQL

  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS pages
SQL
  end
end
