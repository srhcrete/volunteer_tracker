class Project
  attr_reader(:title, :id)

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id)
  end

  def self.all()
    returned_projects = DB.exec("SELECT * FROM projects;")
    projects = []
    returned_projects.each() do |project|
      title = project.fetch("title")
      id = project.fetch("id").to_i()
      projects.push(Project.new({:title => title, :id => id}))
    end
    projects
  end

  def save()
    result = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  def ==(another_project)
    self.title().==(another_project.title())
  end

  def self.find(id)
    result = DB.exec("SELECT * FROM projects WHERE id = #{id};")
    name = result.first().fetch("title")
    Project.new({:title => name, :id => id})
  end

  def volunteers
    project_volunteers = []
    volunteers = DB.exec("SELECT * FROM volunteers where project_id = #{self.id};")
    volunteers.each() do |volunteer|
      id = volunteer["id"].to_i()
      name = volunteer["name"]
      project_id = volunteer["project_id"].to_i()
      project_volunteers.push(Volunteer.new({:id => id, :name => name, :project_id => project_id}))
    end
    project_volunteers
  end

  def update(attributes)
    @title = attributes[:title]
    @id = self.id()
    DB.exec("UPDATE projects SET title = '#{@title}' WHERE id =#{id};")
  end

  def delete
    DB.exec("DELETE FROM projects where id = #{self.id()};")
  end
end
