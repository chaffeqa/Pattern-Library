class CreateUsabilityFindings < ActiveRecord::Migration
  def self.up
    create_table :usability_findings do |t|
      t.integer :pattern_id
      t.text :usability_finding
      t.timestamps
    end

    add_index(:usability_findings, :pattern_id)
  end

  def self.down
    remove_index(:usability_findings, :pattern_id)
    drop_table :usability_findings
  end
end
