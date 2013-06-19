class CreateTableRpaCandidatesAnswers < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS rpa_candidates_answers (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  job_roles_candidate_id int(11) DEFAULT '0' COMMENT 'This field references id field of job_roles_candidates table',
  rpa_tag_id int(11) DEFAULT '0' COMMENT 'This field references id field of rpa_tags table',
  rpa_scenario_id int(11) DEFAULT '0' COMMENT 'This field references id field of rpa_scenarios table',
  rpa_response_id int(11) DEFAULT '0' COMMENT 'This field references id field of rpa_responses table',
  score int(11) DEFAULT '0' COMMENT 'This field store score calculated from response matrix',
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY job_roles_candidate_id (job_roles_candidate_id,rpa_tag_id,rpa_scenario_id,rpa_response_id),
  KEY rpa_tag_id (rpa_tag_id),
  KEY rpa_scenario_id (rpa_scenario_id),
  KEY rpa_response_id (rpa_response_id),
  FOREIGN KEY (job_roles_candidate_id) REFERENCES job_roles_candidates (id) ON DELETE CASCADE,
  FOREIGN KEY (rpa_tag_id) REFERENCES rpa_tags (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY (rpa_scenario_id) REFERENCES rpa_scenarios (id) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=52262 ;
SQL
  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS rpa_candidates_answers
SQL
  end
end
