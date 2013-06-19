class CreateTableManagerAnsweredStatements < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS manager_answered_statements (
  id int(11) NOT NULL AUTO_INCREMENT,
  job_roles_statement_id int(11) NOT NULL,
  agreed_on_response_id int(11) NOT NULL COMMENT 'when manager and user both agree upon\n				        the response of a particular statement.',
  job_roles_statements_response_id int(11) NOT NULL,
  job_roles_user_id int(11) NOT NULL COMMENT 'job role user id of user for which manager giving assessment.',
  is_completed tinyint(1) DEFAULT '0' COMMENT 'when manager reviews particular statement of an assessment.',
  is_joint_review_completed tinyint(1) DEFAULT '0' COMMENT 'when manager and user both gives the joint review of a particular statement of an assessment.',
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6673 ;
SQL
  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS manager_answered_statements
SQL
  end
end
