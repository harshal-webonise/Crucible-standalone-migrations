class CreateTableCompetenciesJobRoles < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS competencies_job_roles (
  id int(11) NOT NULL AUTO_INCREMENT,
  competencies_organisations_product_id int(11) NOT NULL,
  da_job_role_id int(11) NOT NULL,
  cluster_id int(11) NOT NULL,
  is_active tinyint(1) DEFAULT '1',
  is_completed tinyint(1) DEFAULT '0',
  is_deleted tinyint(1) DEFAULT '0',
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY competencies_organisations_product_id (competencies_organisations_product_id,da_job_role_id,cluster_id),
  KEY da_job_role_id (da_job_role_id),
  KEY cluster_id (cluster_id),
   FOREIGN KEY (competencies_organisations_product_id) REFERENCES competencies_organisations_products (id) ON DELETE CASCADE,
   FOREIGN KEY (da_job_role_id) REFERENCES da_job_roles (id) ON DELETE CASCADE,
   FOREIGN KEY (cluster_id) REFERENCES clusters (id) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=852 ;
SQL
  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS competencies_job_roles
SQL
  end
end
