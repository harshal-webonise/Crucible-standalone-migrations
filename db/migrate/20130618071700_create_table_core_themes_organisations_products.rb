class CreateTableCoreThemesOrganisationsProducts < ActiveRecord::Migration
  def up
  execute <<SQL
  CREATE TABLE IF NOT EXISTS core_themes_organisations_products (
  id int(11) NOT NULL AUTO_INCREMENT,
  core_theme_id int(11) DEFAULT '0',
  product_id int(11) DEFAULT '0' COMMENT 'This field is used to store the product id',
  organisation_id int(11) DEFAULT '0' COMMENT 'This field is used to store the organisation id',
  name varchar(255) NOT NULL,
  slug varchar(255) NOT NULL,
  is_critical tinyint(1) DEFAULT '0' COMMENT 'This field is used to store that core theme is critical or not',
  min_pass_score int(11) DEFAULT NULL COMMENT 'Used to store minimum pass score',
  max_pass_score int(11) DEFAULT NULL COMMENT 'Used to store minimum pass score',
  is_completed tinyint(1) DEFAULT '0' COMMENT 'This field is used to check, Questions selection for core theme is completed of not',
  modified datetime NOT NULL,
  created datetime NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY core_theme_id (core_theme_id,product_id,organisation_id),
  KEY product_id (product_id),
  KEY organisation_id (organisation_id),
  FOREIGN KEY (core_theme_id) REFERENCES core_themes (id) ON DELETE CASCADE,
  FOREIGN KEY (product_id) REFERENCES products (id) ON DELETE CASCADE,
  FOREIGN KEY (organisation_id) REFERENCES organisations (id) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;
SQL
  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS core_themes_organisations_products
SQL
  end
end
