class CreateTableWgllAssessmentProjectsJobRolesWgllAssessments < ActiveRecord::Migration
  def up
    execute <<SQL
  CREATE TABLE IF NOT EXISTS wgll_assessment_projects_job_roles_wgll_assessments (
  id int(11) NOT NULL AUTO_INCREMENT,
  wgll_assessment_projects_job_role_id int(11) NOT NULL,
  wgll_assessment_id int(11) NOT NULL,
  invite_later datetime NOT NULL,
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY wgll_assessment_projects_job_role_id (wgll_assessment_projects_job_role_id,wgll_assessment_id),
  KEY wgll_assessment_id (wgll_assessment_id),
  FOREIGN KEY (wgll_assessment_projects_job_role_id)
  REFERENCES wgll_assessment_projects_job_roles (id) ON DELETE CASCADE,
  FOREIGN KEY (wgll_assessment_id) REFERENCES wgll_assessments (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
SQL
  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS wgll_assessment_projects_job_roles_wgll_assessments
SQL
  end
end
