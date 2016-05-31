<pre>User:${currentuser} from Linksharing has send you this email for invite <b>${topic.name}</b> topic.
    <h4>Topic info :-</h4>
    Name: <b>${topic.name}</b>
    Visibility <b>${topic.visiblity}</b>
    Created by: <b>${topic.createdBy}</b>
    Click below link to subscribe <b>${topic.name}</b> :-
<g:link controller="topic" action="join"  base="http://localhost:8080" params='[topicId:"${topic.id}"]'>Subscribe</g:link>
    <b>Make sure you are logged-in while subscribe to ${topic.name} topic.</b>
</pre>