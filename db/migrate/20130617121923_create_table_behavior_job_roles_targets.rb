class CreateTableBehaviorJobRolesTargets < ActiveRecord::Migration
  def up
    execute <<SQL

CREATE TABLE IF NOT EXISTS behavior_job_roles_targets (
  id int(11) NOT NULL AUTO_INCREMENT,
  cluster_id int(11) NOT NULL COMMENT 'This field is added to know target set for which cluster',
  job_role_id int(11) NOT NULL COMMENT 'This field is added to store the job role id',
  target_id int(2) NOT NULL,
  products_target_id int(11) NOT NULL COMMENT 'primary id of products_target table',
  is_active tinyint(1) DEFAULT '1',
  is_deleted tinyint(1) DEFAULT '0',
  is_completed tinyint(1) DEFAULT '0',
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY cluster_id (cluster_id,job_role_id,target_id),
  KEY job_role_id (job_role_id),
  FOREIGN KEY (cluster_id) REFERENCES clusters (id) ON DELETE CASCADE,
  FOREIGN KEY (job_role_id) REFERENCES job_roles (id) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=275 ;
SQL
  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS behavior_job_roles_targets
SQL
  end
end
