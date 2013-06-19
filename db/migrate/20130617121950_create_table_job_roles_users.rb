class CreateTableJobRolesUsers < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS job_roles_users (
  id int(11) NOT NULL AUTO_INCREMENT,
  job_role_id int(11) NOT NULL,
  user_id int(11) NOT NULL,
  organisation_id int(11) NOT NULL,
  product_id int(11) NOT NULL,
  invitation_sent int(1) NOT NULL DEFAULT '0',
  on_which_step int(1) NOT NULL DEFAULT '0',
  on_which_assessment int(11) NOT NULL DEFAULT '0' COMMENT '1.Motivational completed\n                                    2.Values completed\n                                    3.Both completed',
  is_started int(1) NOT NULL DEFAULT '0',
  is_completed int(1) NOT NULL DEFAULT '0',
  is_manager int(1) NOT NULL DEFAULT '0',
  is_active tinyint(1) DEFAULT '1',
  is_deleted tinyint(1) DEFAULT '0',
  is_manager_review_started tinyint(1) DEFAULT '0' COMMENT 'This field is used get manager review is started or not',
  is_manager_reviewed tinyint(1) DEFAULT '0' COMMENT 'This field is used get manager has reviewed assessment or not',
  is_joint_review_started tinyint(1) DEFAULT '0' COMMENT 'This field is used get joint review is started or not',
  is_joint_reviewed tinyint(1) DEFAULT '0' COMMENT 'This field is used get joint review is done or not',
  invite_sent_date datetime NOT NULL,
  jr_start_date datetime NOT NULL,
  jr_completion_date datetime NOT NULL,
  manager_review_start_date datetime NOT NULL,
  manager_review_completed_date datetime NOT NULL COMMENT 'This field is used date on which manager review completed',
  joint_review_start_date datetime NOT NULL,
  joint_review_completed_date datetime NOT NULL COMMENT 'This field is used date on which joint review completed',
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id),
  KEY job_role_id (job_role_id),
  KEY user_id (user_id),
  KEY organisation_id (organisation_id),
  KEY product_id (product_id),
  FOREIGN KEY (job_role_id) REFERENCES job_roles (id) ON DELETE CASCADE,
   FOREIGN KEY (product_id) REFERENCES products (id) ON DELETE CASCADE,
   FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
   FOREIGN KEY (organisation_id) REFERENCES organisations (id) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1070 ;
SQL
  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS job_roles_users
SQL
  end
end
