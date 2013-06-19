class CreateTableRpaBehaviours < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS rpa_behaviours (
  id int(11) NOT NULL AUTO_INCREMENT,
  rpa_assessment_id int(11) DEFAULT '0',
  da_organisations_product_id int(11) DEFAULT '0',
  is_critical tinyint(1) DEFAULT '0',
  is_completed tinyint(1) DEFAULT '0',
  min_pass_score int(11) DEFAULT '0' COMMENT 'This field is used to store the min pass score of behaviour',
  max_pass_score int(11) DEFAULT '0' COMMENT 'This field is used to store the max pass score of behaviour',
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY rpa_assessment_id (rpa_assessment_id,da_organisations_product_id),
  KEY da_organisations_product_id (da_organisations_product_id),
  FOREIGN KEY (rpa_assessment_id) REFERENCES rpa_assessments (id) ON DELETE CASCADE,
  FOREIGN KEY (da_organisations_product_id) REFERENCES da_organisations_products (id) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=66 ;
SQL
  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS rpa_behaviours
SQL
  end
end
