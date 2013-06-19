class CreateTableDasUsersScores < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS das_users_scores (
  id int(11) NOT NULL AUTO_INCREMENT,
  job_roles_user_id int(11) NOT NULL,
  job_role_id int(11) NOT NULL,
  user_id int(11) NOT NULL,
  cluster_id int(11) NOT NULL COMMENT 'This field is used to calculate motivational scores based on cluster',
  score varchar(255) NOT NULL,
  behavior_parameter_id int(11) NOT NULL,
  target_id int(11) NOT NULL,
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id),
  KEY job_roles_user_id (job_roles_user_id),
  KEY job_role_id (job_role_id),
  KEY user_id (user_id),
  KEY cluster_id (cluster_id),
  FOREIGN KEY (job_roles_user_id) REFERENCES job_roles_users (id) ON DELETE CASCADE,
  FOREIGN KEY (job_role_id) REFERENCES job_roles (id) ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
  FOREIGN KEY (cluster_id) REFERENCES clusters (id) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5263 ;
SQL
  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS das_users_scores
SQL
  end
end
