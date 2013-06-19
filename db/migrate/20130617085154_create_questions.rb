class CreateQuestions < ActiveRecord::Migration
  def up
    execute <<SQL
  --
-- Table structure for table questions
--

CREATE TABLE IF NOT EXISTS questions (
  id int(11) NOT NULL AUTO_INCREMENT,
  title text NOT NULL,
  description text NOT NULL,
  is_reverse tinyint(1) DEFAULT '0',
  cluster_id int(11) NOT NULL,
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id),
  KEY cluster_id (cluster_id),
  FOREIGN KEY (cluster_id) REFERENCES clusters (id) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=83 ;

-- --------------------------------------------------------
SQL
  end

  def down
    execute <<SQL
DROP TABLE if EXISTS  questions
SQL
  end
end
