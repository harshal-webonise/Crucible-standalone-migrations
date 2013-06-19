class CreateTableWgllUsersReports < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS wgll_users_reports (
  id int(11) NOT NULL AUTO_INCREMENT,
  job_roles_user_id int(11) NOT NULL,
  assessment_type int(2) NOT NULL DEFAULT '0' COMMENT '1.Motivational\n                                    2.Values',
  assessment_start_date datetime NOT NULL,
  assessment_end_date datetime NOT NULL,
  is_pass tinyint(1) DEFAULT '0',
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id),
  KEY job_roles_user_id (job_roles_user_id),
  FOREIGN KEY (job_roles_user_id) REFERENCES job_roles_users (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
SQL
  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS wgll_users_reports
SQL
  end
end
