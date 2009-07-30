class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.references :client
      t.string  :number

      t.timestamps
    end

    jb = Job.create \
    :number => "00-0000-001",
    :client_id => 1
  end

  def self.down
    drop_table :jobs
  end
end
