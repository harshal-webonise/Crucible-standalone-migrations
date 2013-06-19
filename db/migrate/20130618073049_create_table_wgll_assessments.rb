class CreateTableWgllAssessments < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS wgll_assessments (
  id int(11) NOT NULL AUTO_INCREMENT,
  title varchar(255) NOT NULL,
  description text NOT NULL,
  slug varchar(255) DEFAULT NULL,
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
SQL
  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS wgll_assessments
SQL
  end
end
