class CreateTableCfaCandidatesAnswers < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS cfa_candidates_answers (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  job_roles_candidate_id int(11) DEFAULT '0' COMMENT 'This field references id field of job_roles_candidates table',
  crpt_ct_question_id int(11) DEFAULT '0' COMMENT 'This field references id field of crpt_ct_questions table',
  response_id int(11) DEFAULT '0' COMMENT 'This field stores id of response given by candidates',
  response_value int(11) DEFAULT '0' COMMENT 'This field stores response value of response given by candidates',
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY job_roles_candidate_id (job_roles_candidate_id,crpt_ct_question_id,response_id),
FOREIGN KEY (job_roles_candidate_id) REFERENCES job_roles_candidates (id) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=51932 ;
SQL
  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS cfa_candidates_answers
SQL
  end
end
