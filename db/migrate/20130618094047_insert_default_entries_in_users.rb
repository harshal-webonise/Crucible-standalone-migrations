class InsertDefaultEntriesInUsers < ActiveRecord::Migration
  def up
    execute <<SQL
INSERT INTO users
(id, username, password, first_name, last_name, user_title, image, phone_number, gender, dob,
show_instruction, assesment_instruction, organisation_id, is_verified, verify_token, is_active,
 is_email_change, is_deleted, modified, created)
VALUES
(1, 'admin@crucibleapp.com', '5df405bdb8b05353696a3310475269ceb9b43cc0', NULL, NULL, NULL, NULL,
 NULL, NULL, NULL, 0, 0, 0, 0, NULL, 1, 0, 0, now(), now());


SQL
  end

  def down
    execute <<SQL
SQL
  end
end
