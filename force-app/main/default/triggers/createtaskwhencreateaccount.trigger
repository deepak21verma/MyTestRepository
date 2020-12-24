trigger createtaskwhencreateaccount on Account (after insert) {
    if(trigger.isafter && trigger.isinsert){
        list<account> acclist = new list<account>();
        list<task> tasklist = new list<task>();
        for(account acc : trigger.new){
            task newtask = new task();
            newtask.status = 'in progress';
            newtask.subject = 'email';
            newtask.priority = 'high';
            newtask.whatid =  acc.id;
            tasklist.add(newtask);	   //for link and association : left side - inwhich value need to store - right side - from which value store.
            if(tasklist !=null && !tasklist.isempty()){
                insert tasklist;
            }
        }
    }
}