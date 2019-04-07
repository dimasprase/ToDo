pragma solidity ^0.4.18;

contract ToDo {
    struct Routine { //structure for storing data
        string task;
        string time;
    }
    event LogTaskAdded(uint id, string task, string time); //logging the event after task gets addded

    mapping(uint => Routine) private routines;
    uint[] private ids;

    //function for getting all the task counts
    function getTaskCount() public view returns (uint length) {
        return ids.length;
    }

    //function for getting the task id
    function getTaskIdAt(uint index) public view returns (uint id) {
        return ids[index];
    }

    //function for getting the task detail by supplying the task id
    function getTask(uint id) public view returns (string task, string time) {
        Routine storage routine = routines[id];
        return (
            routine.task,
            routine.time);
    }

    //function for adding task
    function addTask(uint id, string task, string time) public returns (bool successful) {
        routines[id] = Routine({
            task: task,
            time: time
            });
        ids.push(id);
        LogTaskAdded(id, task, time);
        return true;
    }

}