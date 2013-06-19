class CreateTableCfaThemesCandidatesScores < ActiveRecord::Migration
  def up
  execute <<SQL
  CREATE TABLE IF NOT EXISTS cfa_themes_candidates_scores (
  id int(11) NOT NULL AUTO_INCREMENT,
  job_roles_candidate_id int(11) NOT NULL DEFAULT '0',
  core_themes_organisations_product_id int(11) NOT NULL DEFAULT '0',
  achieved_score int(11) NOT NULL DEFAULT '0' COMMENT 'This field is used to store score achived by candidate for theme',
  is_critical tinyint(1) DEFAULT '0' COMMENT 'This field is used to identify theme is critical or not',
  points_achieved int(11) NOT NULL DEFAULT '0' COMMENT 'This field is used to store points achived by candidate for theme',
  created datetime NOT NULL,
  modified datetime NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY job_roles_candidate_id (job_roles_candidate_id,core_themes_organisations_product_id),
  KEY JOB_ROLE_CANDIDATES_INDEX (job_roles_candidate_id),
  KEY core_themes_organisations_product_id (core_themes_organisations_product_id),
  FOREIGN KEY (job_roles_candidate_id) REFERENCES job_roles_candidates (id) ON DELETE CASCADE,
  FOREIGN KEY (core_themes_organisations_product_id) REFERENCES core_themes_organisations_products (id) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10171 ;
SQL
  end

  def down
    execute <<SQL
DROP TABLE IF EXISTS rpa_scenarios
SQL
  end
end
