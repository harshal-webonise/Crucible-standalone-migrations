class CreateTableDaJobRoles < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS da_job_roles (
  id int(11) NOT NULL AUTO_INCREMENT,
  job_role_id int(11) NOT NULL,
  da_organisations_product_id int(11) NOT NULL,
  is_active tinyint(1) DEFAULT '1',
  is_completed tinyint(1) DEFAULT '0',
  is_deleted tinyint(1) DEFAULT '0',
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY job_role_id (job_role_id,da_organisations_product_id),
  KEY da_organisations_product_id (da_organisations_product_id),
  FOREIGN KEY (job_role_id) REFERENCES job_roles (id) ON DELETE CASCADE,
  FOREIGN KEY (da_organisations_product_id) REFERENCES da_organisations_products (id) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=424 ;
SQL

  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS da_job_roles
SQL
  end
end
