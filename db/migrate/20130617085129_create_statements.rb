class CreateStatements < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS statements (
  id int(11) NOT NULL AUTO_INCREMENT,
  title text NOT NULL,
  description text NOT NULL,
  competency_id int(11) NOT NULL,
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id),
  KEY competency_id (competency_id),
  FOREIGN KEY (competency_id) REFERENCES competencies (id) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;
SQL
  end

  def down
    execute <<SQL
DROP TABLE if EXISTS  statements
SQL
  end
end
