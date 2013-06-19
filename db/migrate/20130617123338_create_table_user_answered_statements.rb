class CreateTableUserAnsweredStatements < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS user_answered_statements (
  id int(11) NOT NULL AUTO_INCREMENT,
  job_roles_statement_id int(11) NOT NULL,
  job_roles_statements_response_id int(11) NOT NULL,
  job_roles_user_id int(11) NOT NULL,
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id),
  KEY user_answered_statements_ibfk_3 (job_roles_user_id),
  KEY user_answered_statements_ibfk_4 (job_roles_statement_id),
  KEY user_answered_statements_ibfk_5 (job_roles_statements_response_id),
  FOREIGN KEY (job_roles_statement_id) REFERENCES job_roles_statements (id) ON DELETE CASCADE,
  FOREIGN KEY (job_roles_statements_response_id) REFERENCES job_roles_statements_responses (id) ON DELETE CASCADE,
  FOREIGN KEY (job_roles_user_id) REFERENCES job_roles_users (id) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12003 ;
SQL
  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS user_answered_statements
SQL
  end
end
