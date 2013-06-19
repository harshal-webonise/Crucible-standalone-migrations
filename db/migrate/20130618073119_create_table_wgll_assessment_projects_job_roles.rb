class CreateTableWgllAssessmentProjectsJobRoles < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS wgll_assessment_projects_job_roles (
  id int(11) NOT NULL AUTO_INCREMENT,
  wgll_assessment_project_id int(11) NOT NULL,
  job_role_id int(11) NOT NULL,
  invite_later_date datetime NOT NULL,
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY wgll_assessment_project_id (wgll_assessment_project_id,job_role_id),
  KEY job_role_id (job_role_id),
  FOREIGN KEY (wgll_assessment_project_id) REFERENCES wgll_assessment_projects (id) ON DELETE CASCADE,
  FOREIGN KEY (job_role_id) REFERENCES job_roles (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
SQL
  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS wgll_assessment_projects_job_roles
SQL
  end
end
