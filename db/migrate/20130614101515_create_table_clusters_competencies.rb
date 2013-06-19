class CreateTableClustersCompetencies < ActiveRecord::Migration
  def up
  execute <<SQL
--
-- Table structure for table clusters_competencies
--

CREATE TABLE IF NOT EXISTS clusters_competencies (
  id int(11) NOT NULL AUTO_INCREMENT,
  cluster_id int(11) DEFAULT '0',
  competency_id int(11) DEFAULT '0',
  modified datetime NOT NULL,
  created datetime NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY cluster_id (cluster_id,competency_id),
  KEY competency_id (competency_id),
  FOREIGN KEY (cluster_id) REFERENCES clusters (id) ON DELETE CASCADE,
  FOREIGN KEY (competency_id) REFERENCES competencies (id) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

SQL
  end

  def down
    execute <<SQL
DROP TABLE if EXISTS  clusters_competencies
SQL
  end
end
