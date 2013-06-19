class CreateTableJobRolesStatementsResponses < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS job_roles_statements_responses (
  id int(11) NOT NULL AUTO_INCREMENT,
  job_roles_statement_id int(11) NOT NULL,
  response_id int(11) NOT NULL,
  user_alias varchar(255) NOT NULL,
  manager_alias varchar(255) NOT NULL,
  response varchar(255) DEFAULT NULL,
  allocate_point varchar(255) NOT NULL,
  is_active tinyint(1) DEFAULT '1',
  is_deleted tinyint(1) DEFAULT '0',
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id),
  KEY job_roles_statement_id (job_roles_statement_id),
  FOREIGN KEY (job_roles_statement_id) REFERENCES job_roles_statements (id)
  ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2601 ;
SQL
  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS job_roles_statements_responses
SQL
  end
end
