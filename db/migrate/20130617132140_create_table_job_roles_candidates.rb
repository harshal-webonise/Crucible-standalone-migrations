class CreateTableJobRolesCandidates < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS job_roles_candidates (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  candidate_id int(11) DEFAULT '0' COMMENT 'Candidate id from candidates table',
  job_role_id int(11) DEFAULT '0' COMMENT 'Job Role id from job_roles table',
  certificate_no varchar(15) DEFAULT NULL COMMENT 'Unique Certificate no. assigned for each assessment taken by candidate',
  is_started tinyint(1) DEFAULT '0' COMMENT 'value 1 for this field indicates that candidate started assessment',
  is_completed tinyint(1) DEFAULT '0' COMMENT 'value 1 for this field indicates that candidate completed assessment',
  is_cfa_pass tinyint(1) DEFAULT '0' COMMENT 'this field indicates that candidate is pass or fail in cfa',
  is_rpa_pass tinyint(1) DEFAULT '0' COMMENT 'this field indicates that candidate is pass or fail in rpa',
  cfa_result tinyint(1) DEFAULT '0' COMMENT 'This field indicates the status pass(1) or fail(0) for assessment',
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY UNIQUE_NO (certificate_no),
  KEY JOB_ROLE_INDEX (job_role_id),
  KEY CANDIDATE_INDEX (candidate_id),
  FOREIGN KEY (candidate_id) REFERENCES candidates (id) ON DELETE CASCADE,
  FOREIGN KEY (job_role_id) REFERENCES job_roles (id) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=248;
SQL
  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS job_roles_candidates
SQL
  end
end
