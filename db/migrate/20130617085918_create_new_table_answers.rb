class CreateNewTableAnswers < ActiveRecord::Migration
  def up
  execute <<SQL
    CREATE TABLE IF NOT EXISTS answers (
  id int(11) NOT NULL AUTO_INCREMENT,
  answer varchar(255) NOT NULL,
  question_id int(11) NOT NULL,
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id),
  KEY question_id (question_id),
FOREIGN KEY (question_id) REFERENCES questions (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------
SQL
  end

  def down
    execute <<SQL
  DROP TABLE IF EXISTS answers
SQL

  end
end
