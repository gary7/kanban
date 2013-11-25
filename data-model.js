// Shared data model for client and server code

// TODO separate phases collection
/*
Phases : [{
  name: 'doing'
  label: 'Doing'
}]
*/
// Phases = new Meteor.Collection("phases");

/*
Boards: [{
  name: String,
  columns: [{
    name: String,
    phases: ['doing', 'done']
  }]
}]
*/
Boards = new Meteor.Collection("boards");

/*
WorkItems: [{
  id: int,
  text: String,
  status: 'active', // 'dev', ''
  tags: [String, ...],
  board: String,
  created: timestamp,
  modified: timestamp,
  createdBy: String,
  modifiedBy: String
}]
*/
WorkItems = new Meteor.Collection("workItems");
