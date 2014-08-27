package ops.project

import ops.command.Command

class Task {

    static belongsTo = [Project]
    static hasMany = [commands:Command]

    Project project
    String title
    String description=''
    int indexId = 1
    Date dateCreated
    Date lastUpdated

    static constraints = {
        project()
        title blank: false,size: 1..100
        description size: 0..1000
        indexId()
        dateCreated()
        lastUpdated()
    }

    static mapping = {
        commands sort: 'indexId',order: 'asc'
    }

    @Override
    public String toString() {
        title
    }
}
