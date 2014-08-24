package ops.command

class Command {

    String title
    Date createAt = new Date()
    Date updateAt = new Date()

    static constraints = {
        title blank: false,size: 1..100
        createAt()
        updateAt()
    }

    @Override
    public String toString() {
        title
    }
}
