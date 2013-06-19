class CreateTableCrptAssessmentScores < ActiveRecord::Migration
  def up
  execute <<SQL
  CREATE TABLE IF NOT EXISTS crpt_assessment_scores (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT 'primary key ',
  hash varchar(100) DEFAULT NULL COMMENT 'Used to store has for each assessment',
  product_id int(11) DEFAULT '0' COMMENT 'This field is used to store the product id for which this entry is created',
  organisation_id int(11) DEFAULT '0' COMMENT 'This field is used to store the organisation id',
  on_which_step int(11) DEFAULT '0' COMMENT 'This field is used to identify step no of assessment creation',
  is_completed tinyint(1) DEFAULT '0' COMMENT 'This field is used to check, weather the assessment creation is completed or not',
  min_pass_score int(11) DEFAULT '0' COMMENT 'This field is sum of score of all critical themes in cfa',
  max_pass_score int(11) DEFAULT '0' COMMENT 'This field is used to store the max pass score of cfa set by psa or pa',
  is_candidate_active tinyint(1) DEFAULT '0' COMMENT 'This field is used to check, weather the candidate is active or giving any assessment',
  created datetime NOT NULL COMMENT 'created date',
  modified datetime NOT NULL COMMENT 'modified date',
  PRIMARY KEY (id),
  UNIQUE KEY UNIQUE_TITLE (hash),
  UNIQUE KEY product_id (product_id,organisation_id),
  KEY organisation_id (organisation_id),
  FOREIGN KEY (product_id) REFERENCES products (id) ON DELETE CASCADE,
  FOREIGN KEY (organisation_id) REFERENCES organisations (id) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;
SQL
  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS crpt_assessment_scores
SQL
  end
end
