selectedItem = ->
	Meteor.Kanban?.selectedItem?.get()

resolve_email = (user) ->
	key = 'fogbugz-users'
	users = UserSession.get key || []
	if not users.length
		Meteor.call 'fetch_users', Meteor.userId(), (err, res) ->
			return if err
			UserSession.set key, res
	u = _.find users, (it) ->
		it.id == user.id or it.name == user.name
	u?.email || ''

Template.itemDetails.item = ->
	selectedItem()

Template.itemDetails.eventList = ->
	selectedItem().events || []

Template.itemDetails.contributors = ->
	# todo concat users from changesets
	events = selectedItem().events || []
	all = events
		.filter (it) ->
				it.person? and (it.person.name || '').toLowerCase() != 'nobody'
		.map (it) ->
				user =
					name: it.person.name
					email: resolve_email it.person
				user
	_.uniq all, false, (it) -> it.name

# ui event handlers
Template.itemDetails.events =
	'click .close': ->
		Meteor.Kanban.selectedItem.set null
