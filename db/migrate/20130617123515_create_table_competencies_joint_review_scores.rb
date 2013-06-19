class CreateTableCompetenciesJointReviewScores < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS competencies_joint_review_scores (
  id int(11) NOT NULL AUTO_INCREMENT,
  job_roles_user_id int(11) NOT NULL,
  job_role_id int(11) NOT NULL,
  user_id int(11) NOT NULL,
  joint_review_score varchar(255) NOT NULL COMMENT 'This field is used to store actual joint review score',
  joint_review_score_value int(11) NOT NULL COMMENT 'This field is used to store actual joint review score value',
  target_score varchar(255) NOT NULL COMMENT 'This field is used to store target score',
  target_score_value int(11) NOT NULL COMMENT 'This field is used to store target score value',
  competencies_job_roles_id int(11) NOT NULL,
  parameter_product_details_id int(11) NOT NULL,
  target_parameter_product_details_id int(11) NOT NULL,
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2234 ;
SQL
  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS competencies_joint_review_scores
SQL
  end
end
