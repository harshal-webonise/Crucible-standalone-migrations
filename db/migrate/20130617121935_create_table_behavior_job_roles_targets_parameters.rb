class CreateTableBehaviorJobRolesTargetsParameters < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS behavior_job_roles_targets_parameters (
  id int(11) NOT NULL AUTO_INCREMENT,
  behavior_job_roles_target_id int(11) NOT NULL,
  starts_at int(11) NOT NULL,
  ends_at int(11) NOT NULL,
  motivation_type_id int(2) NOT NULL,
  is_active tinyint(1) DEFAULT '1',
  is_deleted tinyint(1) DEFAULT '0',
  is_completed tinyint(1) DEFAULT '0',
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY behavior_job_roles_target_id (behavior_job_roles_target_id,motivation_type_id),
FOREIGN KEY (behavior_job_roles_target_id) REFERENCES behavior_job_roles_targets (id) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=823 ;
SQL
  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS behavior_job_roles_targets_parameters
SQL
  end
end
