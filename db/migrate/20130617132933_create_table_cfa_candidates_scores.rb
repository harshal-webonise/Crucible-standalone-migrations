class CreateTableCfaCandidatesScores < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS cfa_candidates_scores (
  id int(11) NOT NULL AUTO_INCREMENT,
  job_roles_candidate_id int(11) NOT NULL DEFAULT '0',
  min_pass_score int(11) NOT NULL DEFAULT '0' COMMENT 'This field is used to store min score set for CFA',
  max_pass_score int(11) NOT NULL DEFAULT '0' COMMENT 'This field is used to store max score set for CFA',
  achieved_pass_score int(11) NOT NULL DEFAULT '0' COMMENT 'This field is used to store achived score for CFA',
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id),
  KEY JOB_ROLE_CANDIDATES_INDEX (job_roles_candidate_id),
FOREIGN KEY (job_roles_candidate_id) REFERENCES job_roles_candidates (id) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2035 ;
SQL
  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS cfa_candidates_scores
SQL
  end
end
