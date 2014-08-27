package ops.project

class Project {
    static hasMany = [tasks:Task]

    String title
    String description=''
    Date dateCreated
    Date lastUpdated

    static constraints = {
        title blank: false,size: 1..100
        description size: 0..1000
        dateCreated()
        lastUpdated()
    }

    static mapping = {
        tasks sort: 'indexId',order: 'asc'
    }

    @Override
    public String toString() {
        title
    }
}
