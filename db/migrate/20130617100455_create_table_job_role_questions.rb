class CreateTableJobRoleQuestions < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS job_role_questions (
  id int(11) NOT NULL AUTO_INCREMENT,
  cluster_id int(11) NOT NULL,
  job_role_id int(11) NOT NULL,
  question_id int(11) NOT NULL,
  title varchar(255) NOT NULL,
  user_alias varchar(255) NOT NULL,
  manager_alias varchar(255) NOT NULL,
  is_completed tinyint(1) DEFAULT '0',
  is_active tinyint(1) DEFAULT '1',
  is_deleted tinyint(1) DEFAULT '0',
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY cluster_id (cluster_id,job_role_id,question_id),
  KEY job_role_id (job_role_id),
  KEY question_id (question_id),
  FOREIGN KEY (cluster_id) REFERENCES clusters (id) ON DELETE CASCADE,
  FOREIGN KEY (job_role_id) REFERENCES job_roles (id) ON DELETE CASCADE,
  FOREIGN KEY (question_id) REFERENCES questions (id) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1372 ;
SQL
  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS job_role_questions
SQL
  end
end