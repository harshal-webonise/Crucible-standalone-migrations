class CreateTableCompetenciesOrganisationsProducts < ActiveRecord::Migration
  def up
    execute <<SQL
CREATE TABLE IF NOT EXISTS competencies_organisations_products (
  id int(11) NOT NULL AUTO_INCREMENT,
  competency_id int(11) DEFAULT '0',
  da_organisations_product_id int(11) DEFAULT '0',
  cluster_id int(11) NOT NULL COMMENT 'This field is added to know that particular competency belongs to which cluster',
  name varchar(255) NOT NULL,
  slug varchar(255) NOT NULL,
  modified datetime NOT NULL,
  created datetime NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY competency_id (competency_id,da_organisations_product_id,cluster_id),
  KEY da_organisations_product_id (da_organisations_product_id),
  KEY competencies_organisations_products_ibfk_5 (cluster_id),
  FOREIGN KEY (competency_id) REFERENCES competencies (id) ON DELETE CASCADE,
  FOREIGN KEY (da_organisations_product_id) REFERENCES da_organisations_products (id) ON DELETE CASCADE,
  FOREIGN KEY (cluster_id) REFERENCES clusters (id) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=164 ;

-- --------------------------------------------------------
SQL
  end

  def down
    execute <<SQL
  DROP TABLE IF EXISTS competencies_organisations_products
SQL

  end
end
