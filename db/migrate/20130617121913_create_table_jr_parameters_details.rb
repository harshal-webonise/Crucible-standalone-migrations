class CreateTableJrParametersDetails < ActiveRecord::Migration
  def up
    execute <<SQL

CREATE TABLE IF NOT EXISTS jr_parameters_details (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  slug varchar(255) NOT NULL,
  job_roles_parameter_id int(11) NOT NULL,
  scales_start int(11) NOT NULL,
  scales_end int(11) NOT NULL,
  modified datetime NOT NULL,
  created datetime NOT NULL,
  PRIMARY KEY (id),
  KEY job_roles_parameter_id (job_roles_parameter_id),
  FOREIGN KEY (job_roles_parameter_id) REFERENCES job_roles_parameters (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
SQL
  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS jr_parameters_details
SQL
  end
end
