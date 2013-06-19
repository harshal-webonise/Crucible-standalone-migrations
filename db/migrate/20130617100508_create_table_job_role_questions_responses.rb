class CreateTableJobRoleQuestionsResponses < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS job_role_question_responses (
  id int(11) NOT NULL AUTO_INCREMENT,
  job_role_question_id int(11) NOT NULL,
  product_behavior_parameter_id int(11) NOT NULL,
  is_score_reversed tinyint(1) DEFAULT '0',
  is_active tinyint(1) DEFAULT '1',
  is_deleted tinyint(1) DEFAULT '0',
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY job_role_question_id (job_role_question_id,product_behavior_parameter_id),
  KEY product_behavior_parameter_id (product_behavior_parameter_id),
FOREIGN KEY (job_role_question_id) REFERENCES job_role_questions (id) ON DELETE CASCADE,
   FOREIGN KEY (product_behavior_parameter_id) REFERENCES product_behavior_parameters (id) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1328 ;
SQL
  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS job_role_question_responses
SQL
  end
end
