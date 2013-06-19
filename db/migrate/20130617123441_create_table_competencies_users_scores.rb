class CreateTableCompetenciesUsersScores < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS competencies_users_scores (
  id int(11) NOT NULL AUTO_INCREMENT,
  job_roles_user_id int(11) NOT NULL,
  job_role_id int(11) NOT NULL,
  user_id int(11) NOT NULL,
  score varchar(255) NOT NULL,
  score_value int(11) NOT NULL COMMENT 'This field is used to store actual user score value',
  target_score varchar(255) NOT NULL COMMENT 'This field is used to store target score',
  target_score_value int(11) NOT NULL COMMENT 'This field is used to store target score value',
  competencies_job_roles_id int(11) NOT NULL,
  parameter_product_details_id int(11) NOT NULL,
  target_parameter_product_details_id int(11) NOT NULL,
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id),
  KEY job_roles_user_id (job_roles_user_id),
  KEY job_role_id (job_role_id),
  KEY user_id (user_id),
  KEY competencies_job_roles_id (competencies_job_roles_id),
  KEY parameter_product_details_id (parameter_product_details_id),
  FOREIGN KEY (job_roles_user_id) REFERENCES job_roles_users (id) ON DELETE CASCADE,
  FOREIGN KEY (job_role_id) REFERENCES job_roles (id) ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
  FOREIGN KEY (competencies_job_roles_id) REFERENCES competencies_job_roles (id) ON DELETE CASCADE,
  FOREIGN KEY (parameter_product_details_id) REFERENCES parameter_product_details (id) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10167 ;
SQL
  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS competencies_users_scores
SQL
  end
end
