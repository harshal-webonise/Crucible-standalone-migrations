class CreateTableUserAnsweredQuestions < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS user_answered_questions (
  id int(11) NOT NULL AUTO_INCREMENT,
  job_role_question_id int(11) NOT NULL,
  job_role_question_response_id int(11) NOT NULL,
  job_roles_user_id int(11) NOT NULL,
  is_score_reversed tinyint(1) DEFAULT '0' COMMENT 'This field is used to identify whether the scores for that\n                        question are reversed 1.scores on reverse scale,0.scores on straight scale',
  response_name varchar(255) NOT NULL COMMENT 'It stores the response selected by the user from the set of responses',
  response_id int(11) NOT NULL COMMENT 'It stores the respective index of the selected response from the array in the helper,\n                        if the scores are on reverse scale then the index gets reversed for the selected response',
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id),
  KEY job_role_question_id (job_role_question_id),
  KEY user_answered_questions_ibfk_7 (job_roles_user_id),
  KEY user_answered_questions_ibfk_8 (response_id),
  FOREIGN KEY (job_role_question_id) REFERENCES job_role_questions (id) ON DELETE CASCADE,
  FOREIGN KEY (job_roles_user_id) REFERENCES job_roles_users (id) ON DELETE CASCADE,
  FOREIGN KEY (response_id) REFERENCES responses (id) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28917 ;
SQL
  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS user_answered_questions
SQL
  end
end
