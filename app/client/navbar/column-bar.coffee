Template.column_bar.items = ->
	board = Meteor.Kanban.currentBoard()
	return [] if not board

	board.columns.map (it) ->
		Meteor.Kanban.Column(it.name)

Template.column_bar.events =
	'click .btn': ->
		Meteor.Kanban.Column(this.name).toggle()
