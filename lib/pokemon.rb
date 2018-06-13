require 'pry'


class Pokemon

  attr_reader :id, :name, :type, :db

  def initialize(props={})
    @id = props['id']
    @name = props['name']
    @type = props['type']
    @db = props['db']
  end

  def self.save(name, type, db)

    sql_string = <<-HELLO
      insert into pokemon
      (name, type)
      values
      (?, ?)
    HELLO

    db.execute(sql_string, name, type)
  end

  def self.find(id, db)
    sql_string = <<-PIKA
    select *
    from pokemon
    where ID = ?
    PIKA

    array = db.execute(sql_string, id)
    hash = {"name" => array[0][1], "id" => array[0][0], "type" => array[0][2], "hp" => 60}
    Pokemon.new(hash)

  end


end
