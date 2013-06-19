class CreateTableCompetenciesManagersScores < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS competencies_managers_scores (
  id int(11) NOT NULL AUTO_INCREMENT,
  job_roles_user_id int(11) NOT NULL,
  job_role_id int(11) NOT NULL,
  user_id int(11) NOT NULL,
  manager_score varchar(255) NOT NULL COMMENT 'This field is used to store actual manager score',
  manager_score_value int(11) NOT NULL COMMENT 'This field is used to store actual manager score value',
  target_score varchar(255) NOT NULL COMMENT 'This field is used to store target score',
  target_score_value int(11) NOT NULL COMMENT 'This field is used to store target score value',
  competencies_job_roles_id int(11) NOT NULL,
  parameter_product_details_id int(11) NOT NULL,
  target_parameter_product_details_id int(11) NOT NULL,
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5894 ;
SQL
  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS competencies_managers_scores
SQL
    end
end
