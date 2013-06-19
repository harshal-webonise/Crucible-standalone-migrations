class CreateResponses < ActiveRecord::Migration
  def up
execute <<SQL
--
-- Table structure for table responses
--

CREATE TABLE IF NOT EXISTS responses (
  id int(11) NOT NULL AUTO_INCREMENT,
  response text NOT NULL,
  statement_id int(11) NOT NULL,
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id),
  KEY statement_id (statement_id),
  FOREIGN KEY (statement_id) REFERENCES statements (id) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=117 ;
SQL
  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS responses
SQL
  end
end
