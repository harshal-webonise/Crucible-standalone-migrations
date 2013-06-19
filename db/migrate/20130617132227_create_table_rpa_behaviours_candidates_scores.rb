class CreateTableRpaBehavioursCandidatesScores < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS rpa_behaviours_candidates_scores (
  id int(11) NOT NULL AUTO_INCREMENT,
  job_roles_candidate_id int(11) NOT NULL DEFAULT '0',
  rpa_behaviour_id int(11) NOT NULL DEFAULT '0',
  is_critical tinyint(1) DEFAULT '0',
  min_pass_score int(11) NOT NULL DEFAULT '0' COMMENT 'This field is used to store min score set for behaviour',
  max_pass_score int(11) NOT NULL DEFAULT '0' COMMENT 'This field is used to store max score set for behaviour',
  achieved_pass_score int(11) NOT NULL DEFAULT '0' COMMENT 'This field is used to store score achived by candidate for behaviour',
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY job_roles_candidate_id (job_roles_candidate_id,rpa_behaviour_id),
  KEY JOB_ROLE_CANDIDATES_INDEX (job_roles_candidate_id),
  KEY RPA_BEHAVIOUR_INDEX (rpa_behaviour_id),
  FOREIGN KEY (job_roles_candidate_id) REFERENCES job_roles_candidates (id) ON DELETE CASCADE,
   FOREIGN KEY (rpa_behaviour_id) REFERENCES rpa_behaviours (id) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4229 ;
SQL
  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS rpa_behaviours_candidates_scores
SQL
  end
end
