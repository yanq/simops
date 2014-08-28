package ops.command

import ops.project.Task

class Command {

    static belongsTo = [Task]

    Task task
    int indexId = 1

    String title
    Date dateCreated
    Date lastUpdated

    static constraints = {
        task nullable: true
        indexId()
        title blank: false,size: 1..100
        dateCreated()
        lastUpdated()
    }

    @Override
    public String toString() {
        title
    }
}
