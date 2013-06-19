class CreateTableJobRolesStatements < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS job_roles_statements (
  id int(11) NOT NULL AUTO_INCREMENT,
  job_role_id int(11) NOT NULL,
  statement_id int(11) NOT NULL,
  competencies_job_role_id int(11) NOT NULL,
  user_alias varchar(255) NOT NULL,
  manager_alias varchar(255) NOT NULL,
  title varchar(255) NOT NULL,
  is_completed tinyint(1) DEFAULT '0',
  is_active tinyint(1) DEFAULT '1',
  is_deleted tinyint(1) DEFAULT '0',
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY job_role_id (job_role_id,statement_id,competencies_job_role_id),
  KEY statement_id (statement_id),
  KEY competencies_job_role_id (competencies_job_role_id),
  FOREIGN KEY (job_role_id) REFERENCES job_roles (id) ON DELETE CASCADE,
  FOREIGN KEY (statement_id) REFERENCES statements (id) ON DELETE CASCADE,
  FOREIGN KEY (competencies_job_role_id) REFERENCES competencies_job_roles (id) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=783 ;
SQL

  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS job_roles_statements
SQL
  end
end
