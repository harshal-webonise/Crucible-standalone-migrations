class CreateTableRpaScenarios < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS rpa_scenarios (
  id int(11) NOT NULL AUTO_INCREMENT,
  rpa_behaviour_id int(11) DEFAULT '0',
  scenario_id int(11) DEFAULT '0',
  alias varchar(10000) DEFAULT NULL COMMENT 'This field is alias for scenarios',
  is_critical tinyint(1) DEFAULT '0',
  is_completed tinyint(1) DEFAULT '0',
  background_image varchar(50) DEFAULT NULL COMMENT 'This field holds the selected background image name for scenario',
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY rpa_behaviour_id (rpa_behaviour_id,scenario_id),
  KEY scenario_id (scenario_id),
  FOREIGN KEY (rpa_behaviour_id) REFERENCES rpa_behaviours (id) ON DELETE CASCADE,
   FOREIGN KEY (scenario_id) REFERENCES scenarios (id) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=156 ;
SQL
  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS rpa_scenarios
SQL
  end
end
