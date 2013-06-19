class CreateTableCompetenciesJobRolesTargets < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS competencies_job_roles_targets (
  id int(11) NOT NULL AUTO_INCREMENT,
  competencies_job_role_id int(11) NOT NULL,
  parameter_product_detail_id int(11) NOT NULL,
  is_active tinyint(1) DEFAULT '1',
  is_deleted tinyint(1) DEFAULT '0',
  is_completed tinyint(1) DEFAULT '0',
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY competencies_job_role_id (competencies_job_role_id,parameter_product_detail_id),
  KEY parameter_product_detail_id (parameter_product_detail_id),
  FOREIGN KEY (competencies_job_role_id) REFERENCES competencies_job_roles (id) ON DELETE CASCADE,
  FOREIGN KEY (parameter_product_detail_id) REFERENCES parameter_product_details (id) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=481 ;
SQL
  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS competencies_job_roles_targets
SQL
  end
end
