class Volunteer
  attr_reader(:id, :name, :project_id)

  def initialize(attributes)
    @id = attributes[:id]
    @name = attributes[:name]
    @project_id = attributes[:project_id]
  end

  def save()
    # result = DB.exec("INSERT INTO volunteers (name, project_id) VALUES ('#{@name}', '#{@project_id}') RETURNING id;")
    # @id = result.first()["id"].to_i()
     @id = DB.exec("INSERT INTO volunteers (name, project_id) VALUES ('#{@name}', '#{@project_id}') RETURNING ID").first['id'].to_i
  end

  def ==(another_volunteer)
    self.name().==(another_volunteer.name()) and self.id().==(another_volunteer.id()) and self.project_id().==(another_volunteer.project_id())
  end

  def self.all()
    returned_volunteers = DB.exec("SELECT * FROM volunteers;")
    volunteers = []
    returned_volunteers.each() do |volunteer|
      id = volunteer["id"].to_i()
      name = volunteer["name"]
      project_id = volunteer["project_id"].to_i()
      volunteers.push(Volunteer.new({:name => name, :project_id => project_id, :id => id}))
    end
    volunteers
  end

  def self.find(id)
    result = DB.exec("SELECT * FROM volunteers WHERE id = #{id};")[0]
    id = result["id"].to_i()
    name = result["name"]
    project_id = result["project_id"].to_i()
    Volunteer.new({:id => id, :name => name, :project_id => project_id})
  end
end
