<!-- <h1> Results listing page </h1>
<table>
	<thead>
		<tr>
			<th> Title</th>
			<th> Description</th>
			<th> Image </th>
			<th> Rating </th>
		</tr>
	</thead>

	<tbody>
		<% @res.each do |anime| %>
		<tr>
			<td><%=anime.title%></td>
			<td><%=anime.synopsis%></td>
			<td><%=anime.image%></td>
			<td><%=anime.rating%></td>
		</tr>
		<%end%>
	</tbody>
</table>
 -->



 <%= form_for @search_param do |form| %>
	
	<div class="field">
	    <%= form.label :title %>
	    <%= form.text_field :title %>
	  </div>

	  <%= submit_tag 'Call Action' %>
<% end %>

results page

<% @anime_widget.each do |anime| %>
	<%= form_with model: anime, local: true do |f| %>
		  <%=anime.title%>
		  <%= f.submit "Create" %>
		<% end %>
<%end%>