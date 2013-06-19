class CreateTableWgllAssessmentProjects < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS wgll_assessment_projects (
  id int(11) NOT NULL AUTO_INCREMENT,
  organisation_id int(11) NOT NULL,
  name varchar(255) NOT NULL,
  description text NOT NULL,
  date datetime NOT NULL,
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY name (name,organisation_id),
  KEY organisation_id (organisation_id),
  FOREIGN KEY (organisation_id) REFERENCES organisations (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
SQL
  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS wgll_assessment_projects
SQL
  end
end
