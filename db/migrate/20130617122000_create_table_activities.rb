class CreateTableActivities < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS activities (
  id int(11) NOT NULL AUTO_INCREMENT,
  organisation_id int(11) NOT NULL DEFAULT '0',
  product_id int(11) NOT NULL DEFAULT '0',
  job_role_id int(11) NOT NULL DEFAULT '0',
  user_id int(11) NOT NULL DEFAULT '0',
  reporting_manager_id int(11) NOT NULL DEFAULT '0',
  type int(11) NOT NULL DEFAULT '0',
  created datetime NOT NULL,
  modified datetime NOT NULL,
  data varchar(10000) NOT NULL,
  PRIMARY KEY (id),
  KEY organisation_id (organisation_id),
  KEY product_id (product_id),
  FOREIGN KEY (organisation_id) REFERENCES organisations (id) ON DELETE CASCADE,
   FOREIGN KEY (product_id) REFERENCES products (id) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3320 ;
SQL
  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS activities
SQL
  end
end
