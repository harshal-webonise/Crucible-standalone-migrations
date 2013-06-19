class CreateTableRpaResponses < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS rpa_responses (
  id int(11) NOT NULL AUTO_INCREMENT,
  rpa_scenario_id int(11) DEFAULT '0',
  scenario_response_id int(11) DEFAULT '0',
  rpa_tag_id int(11) DEFAULT '0',
  name varchar(10000) DEFAULT NULL COMMENT 'This field is alias for responses',
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY rpa_scenario_id (rpa_scenario_id,scenario_response_id,rpa_tag_id),
  KEY scenario_response_id (scenario_response_id),
  KEY rpa_tag_id (rpa_tag_id),
  FOREIGN KEY (rpa_scenario_id) REFERENCES rpa_scenarios (id) ON DELETE CASCADE ON UPDATE NO ACTION,
  FOREIGN KEY (scenario_response_id) REFERENCES scenario_responses (id) ON DELETE CASCADE ON UPDATE NO ACTION,
  FOREIGN KEY (rpa_tag_id) REFERENCES rpa_tags (id) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=565 ;
SQL
  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS rpa_responses
SQL
  end
end
