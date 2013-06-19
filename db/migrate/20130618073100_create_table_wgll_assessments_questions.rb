class CreateTableWgllAssessmentsQuestions < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS wgll_assessments_questions (
  id int(11) NOT NULL AUTO_INCREMENT,
  wgll_assessment_id int(11) NOT NULL,
  title varchar(255) NOT NULL,
  interim varchar(255) DEFAULT NULL,
  extreme varchar(255) DEFAULT NULL,
  description text,
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id),
  KEY wgll_assessment_id (wgll_assessment_id),
  FOREIGN KEY (wgll_assessment_id) REFERENCES wgll_assessments (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
SQL
  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS wgll_assessments_questions
SQL
  end
end
