module ApplicationHelper
  def time_delta time
		if time < Time.now
			distance_of_time_in_words_to_now(time) + " ago"
		else
			distance_of_time_in_words_to_now(time) + " from now"
		end
	end

	def truthy_thumb(value)
		if value=="*"
			i('star').html_safe
		elsif value
			i('thumbs-up').html_safe
		else
			i('thumbs-down').html_safe
		end
	end

	def i(c)
		('<i class="fa fa-' + c + '"></i>').html_safe
	end

  def nice_date d
		d.strftime("%A, %B %d, %Y")
	end

	def nice_datetime d
		d.strftime("%I:%M %p %m-%d-%Y")
	end

	def pills_for collection, klass = nil
		buffer = '<ul class="nav nav-pills ' + (klass ? klass : '') + '">' + "\n"
		collection.each do |item|
			if item.is_a?(Room) && !item.open
				buffer << '<li>' + link_to(item.display, (can?(:update, item) ? item : "#" ), :class => 'closedRoom') + '</li>' + "\n"
			else
				buffer << '<li>' + link_to(item.display, item) + '</li>' + "\n"
			end
		end
		buffer << '</ul>'
		buffer.html_safe
	end
end
