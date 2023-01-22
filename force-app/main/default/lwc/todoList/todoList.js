import { LightningElement, track } from 'lwc';

export default class W2 extends LightningElement {
   @track
   todoTasks = [
      // {
      //    id:1,
      //    name:'Task 1'
      // }
   ];
   
   newTask='';

   updateNewTask(event){
      this.newTask = event.target.value;
   }

   addTaskToList(event){
      //* push funtion is adding an element to the end of the array, 
      //*unshift funtion is adding an element at the beginning of the array
      this.todoTasks.push({
         id:this.todoTasks.length+1,
         name: this.newTask
      });
      this.newTask = '';
   }

   deleteTaskFromList(event){
      let idToDelete = event.target.name;
      let todoTasks = this.todoTasks;
      let todoTaskIndex;
     
      for(let i=0; i< todoTasks.length; i++){
         if(idToDelete === this.todoTasks[i].id) {
            todoTaskIndex = i;
         }
      }
      this.todoTasks.splice(todoTaskIndex, 1);

      // second way:
      // todoTasks.splice(
      //    todoTasks.findIndex(function(todoTask) {
      //       return todoTask.id === idToDelete ;
      //    })
      //    , 1
      //    );

      // third way:
      // todoTasks.splice(todoTasks.findIndex(todoTask => todoTask.id === idToDelete), 1);

   }
}