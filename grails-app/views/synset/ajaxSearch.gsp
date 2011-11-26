
    <g:if test="${synsetList.size() == 0}">
    	<g:message code="result.no.matches.for" args="${[params.q.toString()?.encodeAsHTML()]}"/>
    </g:if>
    <g:else>
	    <table>
	        <g:each in="${synsetList}" status="i" var="synset">
	             <g:set var="radioButtonId" value="radioButton${params.linkTypeName.encodeAsHTML()}${i}"/>
	             <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
	                 <td><g:radio id="${radioButtonId}" name="targetSynset${params.linkTypeName.encodeAsHTML()}.id" value="${synset.id}"
	                    checked="${false}"/></td>
	                 <td>
	                     <label for="${radioButtonId}"><g:set var="firstVal" value="${true}"/>
	                         <g:each in="${synset?.otherTerms()?.sort()}" var="term">
	                             <g:if test="${!firstVal}">
	                             	<span class="d">&middot;</span>
	                             </g:if>
	                             ${term.toString()?.encodeAsHTML()}
                                 <g:if test="${term.level}">
                                   (${term.level.shortLevelName})
                                 </g:if>
	                             <g:set var="firstVal" value="${false}"/>
	                         </g:each>
	                     </label>
	                     <g:link target="_blank" action="edit" id="${synset.id}">&gt;&gt;&nbsp;Details</g:link>
	                 </td>
	             </tr>
	        </g:each>
	    </table>
	    <div class="metaInfo">Tipp: Auswahl mit den rauf/runter Cursor-Tasten</div>

    </g:else>

    <table>
      <tr>
        <td valign="top">
          <g:link action="create" params="[term : params.q]" target="_blank">
               <img src="${createLinkTo(dir:'images',file:'icon-add.png')}" alt="Add icon" />
          </g:link>
        </td>
        <td>&nbsp;</td>
        <td>
          <g:link action="create" params="[term : params.q]" target="_blank">
               <g:message code="result.create.synset" args="${[params.q.encodeAsHTML()]}" />
          </g:link>
        </td>
      </tr>
    </table>
