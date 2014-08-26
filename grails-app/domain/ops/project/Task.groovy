package ops.project

import ops.command.Command

class Task {

    static belongsTo = [Project]
    static hasMany = [commands:Command]

    Project project
    String title
    String description=''
    Date dateCreated
    Date lastUpdated

    static constraints = {
        project()
        title blank: false,size: 1..100
        description size: 0..1000
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
