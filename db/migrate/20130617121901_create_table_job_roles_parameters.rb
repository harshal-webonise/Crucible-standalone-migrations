class CreateTableJobRolesParameters < ActiveRecord::Migration
  def up
    execute <<SQL

CREATE TABLE IF NOT EXISTS job_roles_parameters (
  id int(11) NOT NULL AUTO_INCREMENT,
  total_responses int(11) NOT NULL,
  job_role_id int(11) NOT NULL,
  type tinyint(1) DEFAULT '0',
  modified datetime NOT NULL,
  created datetime NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY job_role_id (job_role_id,total_responses),
FOREIGN KEY (job_role_id) REFERENCES job_roles (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
SQL
  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS job_roles_parameters
SQL
  end
end
