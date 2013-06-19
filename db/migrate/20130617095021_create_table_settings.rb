class CreateTableSettings < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS settings (
  id int(11) NOT NULL AUTO_INCREMENT,
  organisation_id int(11) DEFAULT '0',
  product_id int(11) DEFAULT '0',
  name varchar(50) NOT NULL,
  value varchar(255) NOT NULL,
  original_file_name varchar(255) DEFAULT NULL,
  type int(11) DEFAULT '0' COMMENT '0-default,1-text,2-textArea,3-file',
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;
SQL

  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS settings
SQL
  end
end
