class InsertDefaultEntriesInPages < ActiveRecord::Migration
  def up
    execute <<SQL
   INSERT INTO pages (id, reference_id, organisation_id, product_id, language_id, meta_keywords, meta_description,
title, body, is_active, slug, created, modified) VALUES
(1, NULL, 0, 0, NULL, '', '', 'Terms of Use', 'dummy dummy dummy dummy dummy dummy dummy dummy', 0, 'terms_of_use', now(), now()),
(2, NULL, 0, 0, NULL, '', '', 'Privacy Policy', 'dummy dummy dummy dummy dummy dummy dummy dummy', 0, 'privacy_policy', now(), now());
SQL
  end

  def down
  end
end
