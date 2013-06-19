class InsertDefaultEntriesInTargets < ActiveRecord::Migration
  def up
    execute <<SQL
INSERT INTO targets (id, name, score, modified, created, class) VALUES
(1, 'Lesser Focus', 1, now(), now(), 'lowMotivationBg'),
(2, 'Content to Focus', 2, now(), now(), 'mediumMotivationBg'),
(3, 'Strong Focus', 3, now(), now(), 'highlyMotivationBg');
SQL
  end

  def down
  end
end
