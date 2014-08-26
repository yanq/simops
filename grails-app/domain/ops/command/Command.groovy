package ops.command

import ops.project.Task

class Command {

    static belongsTo = [Task]

    Task task
    int indexId = 1

    String title
    Date createAt = new Date()
    Date updateAt = new Date()

    static constraints = {
        task nullable: true
        indexId()
        title blank: false,size: 1..100
        createAt()
        updateAt()
    }

    @Override
    public String toString() {
        title
    }
}
