class CreateTableWgllUsersAnswers < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS wgll_users_answers (
  id int(11) NOT NULL AUTO_INCREMENT,
  wgll_assessments_question_id int(11) NOT NULL,
  wgll_assessment_projects_job_roles_wgll_assessment_id int(11) NOT NULL,
  user_id int(11) NOT NULL,
  response_id int(11) DEFAULT '0',
  weightage int(11) DEFAULT '0',
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY wgll_assessments_question_id (wgll_assessments_question_id,wgll_assessment_projects_job_roles_wgll_assessment_id,user_id,response_id),
  KEY wgll_assessment_projects_job_roles_wgll_assessment_id (wgll_assessment_projects_job_roles_wgll_assessment_id),
  KEY user_id (user_id),
  KEY response_id (response_id),
  FOREIGN KEY (wgll_assessments_question_id) REFERENCES wgll_assessments_questions (id) ON DELETE CASCADE,
  FOREIGN KEY (wgll_assessment_projects_job_roles_wgll_assessment_id) REFERENCES wgll_assessment_projects_job_roles_wgll_assessments (id) ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
  FOREIGN KEY (response_id) REFERENCES responses (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
SQL
  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS wgll_users_answers
SQL
  end
end
