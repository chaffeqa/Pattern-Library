class CreateAccessibilityFindings < ActiveRecord::Migration
  def self.up
    create_table :accessibility_findings do |t|
      t.integer :pattern_id
      t.text :accessibility_finding
      t.timestamps
    end

    add_index(:accessibility_findings, :pattern_id)
  end

  def self.down
    remove_index(:accessibility_findings, :pattern_id)
    drop_table :accessibility_findings
  end
end
