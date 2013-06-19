class CreateTableScenarioResponses < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS scenario_responses (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary id of role_scenario_responses table',
  scenario_id int(11) NOT NULL COMMENT 'Primary key for role_scenario table',
  response varchar(10000) DEFAULT '' COMMENT 'Role scenario response',
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id),
  KEY scenario_id (scenario_id),
  FOREIGN KEY (scenario_id) REFERENCES scenarios (id) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=93 ;
SQL
  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS scenario_responses
SQL
  end
end
