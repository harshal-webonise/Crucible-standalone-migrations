class CreateTableRpaAssessments < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS rpa_assessments (
  id int(11) NOT NULL AUTO_INCREMENT,
  hash varchar(100) DEFAULT NULL COMMENT 'Used to store has for each assessment',
  job_role_id int(11) DEFAULT '0',
  on_which_step int(11) DEFAULT '0',
  is_completed tinyint(1) DEFAULT '0',
  min_pass_score int(11) DEFAULT '0' COMMENT 'This field is sum of score of all critical behaviours in rpa',
  max_pass_score int(11) DEFAULT '0' COMMENT 'This field is used to store the max pass score of rpa set by psa or pa',
  retake_days int(11) DEFAULT '0',
  is_candidate_active tinyint(1) DEFAULT '0' COMMENT 'This field is used to check, weather the candidate is active or giving any assessment',
  button_title varchar(255) DEFAULT NULL COMMENT 'This field is used to store button title of external url in rpa pass page',
  job_role_url varchar(255) DEFAULT NULL COMMENT 'This field is used to store external url for job role in rpa pass page',
  created datetime DEFAULT NULL,
  modified datetime DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY UNIQUE_TITLE (hash),
  KEY job_role_id (job_role_id),
  FOREIGN KEY (job_role_id) REFERENCES job_roles (id) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;
SQL
  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS rpa_assessments
SQL
  end
end
