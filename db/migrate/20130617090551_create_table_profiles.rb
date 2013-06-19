class CreateTableProfiles < ActiveRecord::Migration
  def up
execute <<SQL
CREATE TABLE IF NOT EXISTS profiles (
  id int(11) NOT NULL AUTO_INCREMENT,
  user_id int(11) NOT NULL,
  employee_id varchar(255) DEFAULT NULL,
  job_title varchar(255) DEFAULT NULL,
  aliases_level_id int(11) DEFAULT '0',
  created datetime NOT NULL,
  modified datetime NOT NULL,
  reporting_manager_id int(11) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY user_id (user_id,employee_id),
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=887 ;
SQL
  end

  def down
execute <<SQL
 DROP TABLE IF EXISTS  profiles
SQL
  end
end
