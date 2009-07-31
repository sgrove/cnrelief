class CreateProofMachines < ActiveRecord::Migration
  def self.up
    create_table :proof_machines do |t|
      t.references :company

      t.string :name

      t.timestamps
    end

    pm = ProofMachine.create \
    :company_id => 1,
    :name => "primary"
  end

  def self.down
    drop_table :proof_machines
  end
end
