class CreateTableCrptCoreThemeScores < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS crpt_core_theme_scores (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT 'primary key ',
  core_themes_organisations_product_id int(11) DEFAULT '0' COMMENT 'This field is used to store the core themes organisations products id',
  bucket_number int(2) DEFAULT '0' COMMENT 'Used to store bucket number',
  min_value int(2) DEFAULT '0' COMMENT 'Used to store min value for bucket',
  max_value int(5) DEFAULT '0' COMMENT 'Used to store max value for bucket',
  points int(1) DEFAULT NULL COMMENT 'Used to store points, 0:failed, 1:Acceptable, 2:Most Suited',
  created datetime NOT NULL COMMENT 'created date',
  modified datetime NOT NULL COMMENT 'modified date',
  PRIMARY KEY (id),
  UNIQUE KEY core_themes_organisations_product_id (core_themes_organisations_product_id,bucket_number),
  KEY core_themes_organisations_product_id1 (core_themes_organisations_product_id),
  FOREIGN KEY (core_themes_organisations_product_id) REFERENCES core_themes_organisations_products (id)
  ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=136 ;
SQL
  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS crpt_core_theme_scores
SQL
  end
end
