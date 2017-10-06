if ('https:' == document.location.protocol) {
	jQuery('#login').attr('style', 'display:block');
}

function submitGoogleForm() {
	document.forms[0].action = "http://find.utoronto.ca/search";
	document.forms[0].method = "get";
	document.forms[0].submit();
}
/*			
jQuery(document).ready(function() {
	//Replace SharePoint ribbon scrolling with Jquery ribbon scrolling
	var $scrollingDiv = $("#scrollingDiv");
 	$(window).scroll(function(){
  		$scrollingDiv
   		.stop()
    	.animate({"marginTop": ($(window).scrollTop()) + "px"}, "fast");
	});
	
});
		

	
function setTopPos() {
	jQuery('.ms-cui-menu').each(function(){
    	var origTop = $(this).data('origTop') || $(this).position().top;
		$(this).data('origTop',origTop );
		newTop = $(window).scrollTop() + origTop;
		$(this).css({  top : newTop  });
	});
}

setInterval(setTopPos, 100);

// Set web part tool pane location
jQuery(document).ready(function() {
 $(".ms-ToolPaneBody").css({  height: ($(window).height() - 245) + "px"});
	var $webPartToolPane = $(".ms-ToolPaneOuter");
	$(window).scroll(function(){
	$webPartToolPane
   .stop()
   .animate({"marginTop": ($(window).scrollTop() + 80) + "px"}, "fast"); });
});
*/

function printDiv(divName) {
     var printContents = document.getElementById(divName).innerHTML;
     var originalContents = document.body.innerHTML;

     document.body.innerHTML = printContents;

     window.print();

     document.body.innerHTML = originalContents;
}

/* Expand a blade/accordion on page load */
function getUrlParameter(sParam)
{
    var sPageURL = window.location.search.substring(1);
    var sURLVariables = sPageURL.split('&');
    for (var i = 0; i < sURLVariables.length; i++) 
    {
        var sParameterName = sURLVariables[i].split('=');
        if ( sParameterName[0].toUpperCase() == sParam.toUpperCase() ) 
        {
            return sParameterName[1];
        }
    }   
    
    return null;
}   

function loadGradFunding_yof(data)
{
	if ($('#gradfund_yof').length <= 0) {
		return;
	}

	$('#gradfund_yof').DataTable({
		"paging": false,
		"info": false,
		"sort": false,
        "aaData": data.d.results,
		"aoColumnDefs": [{
		   "aTargets": [2,5],
		   "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
		     var $currencyCell = $(nTd);
		     var commaValue = $currencyCell.text();
		     
		     if ($.isNumeric($currencyCell)) {
	           commaValue = parseInt($currencyCell.text()).toLocaleString('en-CA', { style: 'currency', currency: 'CAD' });
			 }
			 
		     $currencyCell.text(commaValue);
		   }
		}],
        "aoColumns": [{
            "mData": "GraduateUnitName",
            "sClass": "boldUnitName",
            "render": function(data, type, full, meta)
            		  {
            		    return "<a href='"+full.UnitActualFundingURL+"'>"+data+"</a>";
            		  }
        }, {
            "mData": "MastersYearsOfFunding"
        }, {
            "mData": "MastersBaseFundingAmount",
            "sClass":"border-right"
        }, {
	        "mData": "PhDYearsOfFunding"
        }, {
	        "mData": "PhDYearsOfFundingDirectEntry"
        }, {
	        "mData": "PhDBaseFundingAmount"
        }]
    });
}

function loadGradFunding_fellow(data)
{
	if ($('#gradfund_fellow').length <= 0) {
		return;
	}

	$('#gradfund_fellow').DataTable({
		"paging": false,
		"info": false,
		"sort": false,
        "aaData": data.d.results,
        "aoColumns": [{
            "mData": "GraduateUnitName",
            "sClass": "boldUnitName",
            "render": function(data, type, full, meta)
            		  {
            		    return "<a href='"+full.UnitActualFundingURL+"'>"+data+"</a>";
            		  }
        }, {
            "mData": "PaymentOfDeptFellowshipsInBaseFundingU"
        }, {
            "mData": "PaymentOfDeptFellowshipsInBaseFundingN"
        }]
    });
}

function loadGradfund_scholar(data)
{
	if ($('#gradfund_scholar').length <= 0) {
		return;
	}

	$('#gradfund_scholar').DataTable({
		"paging": false,
		"info": false,
		"sort": false,
        "aaData": data.d.results,
        "aoColumns": [{
            "mData": "GraduateUnitName",
            "sClass": "boldUnitName",
            "render": function(data, type, full, meta)
            		  {
            		    return "<a href='"+full.UnitActualFundingURL+"'>"+data+"</a>";
            		  }
        }, {
            "mData": "ExtScholarshipsInBaseFunding"
        }, {
            "mData": "ExtScholarshipsTopupOffered"
        }, {
        	"mData": "ExtScholarshipsEffectOnTAPosition"
        }, {
        	"mData": "ExtScholarshipsEffectOnRA"
        }]
    });
}

function loadGradFunding_tap(data)
{
	if ($('#gradfund_tap').length <= 0) {
		return;
	}

	$('#gradfund_tap').DataTable({
		"paging": false,
		"info": false,
		"sort": false,
        "aaData": data.d.results,
        "aoColumns": [{
            "mData": "GraduateUnitName",
            "sClass": "boldUnitName",
            "render": function(data, type, full, meta)
            		  {
            		    return "<a href='"+full.UnitActualFundingURL+"'>"+data+"</a>";
            		  }
        }, {
            "mData": "TAPositionsInBaseFunding"
        }, {
            "mData": "TAPositionsNormalHours"
        }, {
        	"mData": "TAPositionsNormalTAIncome"
        }]
    });
}

function loadGradFunding_income(data)
{
	if ($('#gradfund_income').length <= 0) {
		return;
	}

	$('#gradfund_income').DataTable({
		"paging": false,
		"info": false,
		"sort": false,
        "aaData": data.d.results,
		"aoColumnDefs": [{
		   "aTargets": [1],
		   "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
		     var $currencyCell = $(nTd);
		     var commaValue = $currencyCell.text();
		     
		     if ($.isNumeric($currencyCell)) {
	           commaValue = parseInt($currencyCell.text()).toLocaleString('en-CA', { style: 'currency', currency: 'CAD' });
			 }
			 
		     $currencyCell.text(commaValue);
		   }
		}],
        "aoColumns": [{
            "mData": "GraduateUnitName",
            "sClass": "boldUnitName",
            "render": function(data, type, full, meta)
            		  {
            		    return "<a href='"+full.UnitActualFundingURL+"'>"+data+"</a>";
            		  }
        }, {
            "mData": "NormalT4IncomeIncBaseFundingPackage"
        }]
    });
}

function loadGradFunding_research(data)
{
	if ($('#gradfund_research').length <= 0) {
		return;
	}
	
	$('#gradfund_research').DataTable({
		"paging": false,
		"info": false,
		"sort": false,
        "aaData": data.d.results,
		"aoColumnDefs": [{
		   "aTargets": [2],
		   "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
		     var $currencyCell = $(nTd);
		     var commaValue = $currencyCell.text();
		     
		     if ($.isNumeric($currencyCell)) {
	           commaValue = parseInt($currencyCell.text()).toLocaleString('en-CA', { style: 'currency', currency: 'CAD' });
			 }
		       
		     $currencyCell.text(commaValue);
		   }
		}],
        "aoColumns": [{
            "mData": "GraduateUnitName",
            "sClass": "boldUnitName",
            "render": function(data, type, full, meta)
            		  {
            		    return "<a href='"+full.UnitActualFundingURL+"'>"+data+"</a>";
            		  }
        }, {
            "mData": "RAPositionsResearchStipendIncluded"
        }, {
            "mData": "RAPositionsResearchStipendNormalRA"
        }, {
            "mData": "RAPositionsResearchStipendNormalWo"
        }, {
        	"mData": "RAPositionsResearchStipendMandated"
        }, {
        	"mData": "Notes"
        }]
    });
}

function loadProgramFaq(filter) {

      $('#programFaqTable').dataTable({  
        "sProcessing": "Retrieving FAQs...",  
        "bSort": false,  
        "bLengthChange": false,  
        "bFilter": false,  
        //"iDisplayLength": rowCount,  
        "bServerSide": true,  
        //"sPaginationType": "full_numbers",  
        "sAjaxDataProp": "d.results",  
        paging: false,
        info: false,
        "bAutoWidth": false,  
        //"aaSorting": [[1, 'desc']],  
        "aoColumnDefs": [  
          {  
            "aTargets": [0],  
            "mData": function (source, type, val) {			
              return  source.QuestionName; 
              }  
          },              
          {  
                     "aTargets": [1],  
            "mData": function (source, type, val) {  
              return source.Domestic;
              }  
          },  
          {  
                     "aTargets": [2],  
            "mData": function (source, type, val) {  
              return source.International;
              }  
          } 
        ], 
	    "fnPreDrawCallback": function( oSettings ) {
		    var prevQuestionId = '';	
		    var groupCounter = 0;   
		    var domestic = '';   
		    var international = '';
		    var api = this.api();
			api.rows().every( function ( rowIdx, tableLoop, rowLoop ) {		      

		    var data = this.data();
			var nextRow = api.row(rowIdx + 1);
			
		    if (data && data != null) {		     
		        var domesticTemp = (data.DegreeCode != null ? data.DegreeCode + '-' : '') + data.Domestic;
		        var internationalTemp = (data.DegreeCode != null ? data.DegreeCode + '-' : '') + data.International;
		            			
				if (data.QuestionID != prevQuestionId) {
					// First item in group
					prevQuestionId = data.QuestionID;
					groupCounter++;
					domestic = domesticTemp;
					international = internationalTemp;
				} else {
					domestic += '<br/>' + domesticTemp;
				    international += '<br/>' + internationalTemp;
				}				

				data.Domestic = domestic;
				data.International = international;
				data.QuestionName = groupCounter + '. ' + data.QuestionName;
				data.DegreeCode = '';
    			this.data(data);				
							
			    if (!(!nextRow || nextRow == null || nextRow.data() == null || nextRow.data().QuestionID != data.QuestionID)) {
				    //api.row(rowIdx).remove();
    				$(api.row(rowIdx).node()).css({ display: "none" });
    			}    			
			}
		  });
	    },
        "fnServerData": function (sSource, aoData, fnCallback, oSettings) {  		
        	var restQuery = "/_api/lists/getbytitle('SGSPgmFaq')/items?$select=Domestic,International,ProgramCode,DegreeCode,QuestionID,QuestionName,QuestionSequence&$orderby=QuestionSequence&$filter=ProgramCode eq '" + filter + "'";
          $.ajax({  
			headers: {
				accept: "application/json;odata=verbose"
			},
            "type": "GET",  
            "url": restQuery,  
            "data": aoData,  
            "success": function (json) {     
       
              fnCallback(json);  
            },
            "error": function(data, errorCode, errorMessage) {
            	console.log(data, errorCode, errorMessage);
            }
          });    
        }         
      });  	  		
      
       $.ajax({
		url: "/_api/web/lists/getByTitle('SGSPgmFaqFundingLinks')/items?$filter=sis_pgm_cd eq '"+filter+"'",
		type: "GET",
		headers: {
			accept: "application/json;odata=verbose"
		},
		success: function(data) {
			loadFundingInformation(data.d.results);
		},
		error: function(data, errorCode, errorMessage) {
			//console
		}
	});
     
}

function loadFundingInformation(data)
{	
	if (data[0].FacultyName != null) {	
		//done this way because there is more than one.
		$(".FacultyName").text(data[0].FacultyName);
	}	
	
	//done this way because there is more than one.
	$(".UnitName").text(data[0].GraduateUnitName);  
	//$(".FacultyBaseUrl").text(data[0].FacultyBaseFundingURL);  
	
	ReplaceAllHrefLinks(".FacultyBaseUrl", data[0].FacultyBaseFundingURL);
	ReplaceElementValue($("#FacultyBaseUrl"), data[0].FacultyBaseFundingURL);
	//ReplaceElementValue($("#ProgramUrl"), data[0].ProgramPageURL);
	ReplaceElementValue($("#UnitActualUrl"), data[0].UnitActualFundingURL);	
}

function getCurrentItem(success,error) {  
   var context = SP.ClientContext.get_current();
   var web = context.get_web();
   var listId = _spPageContextInfo.pageListId;
   var itemId = _spPageContextInfo.pageItemId;
   var list = web.get_lists().getById(listId);
   var listItem = list.getItemById(itemId);
   context.load(listItem);

   context.executeQueryAsync(
     function() {
        success(listItem);
     },
     error
   );
}

function loadGradFundingData(filter) {                           
	var oDataUrl = "/_api/web/lists/getByTitle('SGSGradFundingBase')/items?$filter=FacultyOrgCode eq '"+filter+"'";

    $.ajax({
        url: oDataUrl,
        type: "GET",
        dataType: "json",
        headers: {
            "accept": "application/json;odata=verbose"
        },
        success: function(data) {
            try 
            {
            	loadGradFunding_yof(data);
          	} 
          	catch ( err )
          	{ 
          		console.log( err );
          	}

            try 
            {          	
	        	loadGradFunding_fellow(data);
          	} 
          	catch ( err )
          	{ 
          		console.log( err );
          	}

            try 
            {
	        	loadGradfund_scholar(data);
          	} 
          	catch ( err )
          	{ 
          		console.log( err );
          	}

            try 
            {
	        	loadGradFunding_tap(data);
          	} 
          	catch ( err )
          	{ 
          		console.log( err );
          	}

			try
			{
	        	loadGradFunding_income(data);
         	} 
          	catch ( err )
          	{ 
          		console.log( err );
          	}

			try
			{
	        	loadGradFunding_research(data);
			} 
          	catch ( err )
          	{ 
          		console.log( err );
          	}
        },
        error: function(data, errCode, errMessage) {
        	console.log(errCode);
        }
    });
}

function pageInit(currentListItem) {
	var dynamicPageID = currentListItem.get_item('Dynamic_x0020_Page_x0020_ID');
	
	if ($('#gradfund_yof').length > 0) {
		loadGradFundingData(dynamicPageID); 
	}
	
	if ($('#programFaqTable').length > 0) {
	    loadProgramFaq(dynamicPageID);
	}
	
	if ($('#chartDomesticLegend').length > 0) {
	    loadActualFundingGraphs(dynamicPageID);
	}
}


jQuery(document).ready(function() {
	
	var expand = getUrlParameter('expand');
	var scroll = getUrlParameter('scroll');
	var jump = getUrlParameter('jump');
	var expandScroll = getUrlParameter('expandScroll');
	var expandJump = getUrlParameter('expandJump');		
	var delay = 1000;
	
	// Expand and Jump do the same thing, Jump just has a delay of 0 for the animation
	
	if ( expandScroll != null )
	{
		expand = expandScroll;
		scroll = expandScroll;
	}
	if ( expandJump != null )
	{
		expand = expandJump;
		scroll = expandJump;
		delay = 0;
	}	
	if ( jump != null )
	{
		scroll = jump;
		delay = 0;
	}
	
	// Expand Accordion ID
	if ( expand != null )
	{			
		// Expand the accordion
		$("#" + expand).click();
	}
	
	// Scroll ID into view
	if ( scroll != null )
	{
		$("html, body").animate({ scrollTop: $( '#' + scroll ).offset().top }, delay);
	}

});
 
 
 
/** SYSTEM NOTIFICATIONS START ***********************************************************************************/
ExecuteOrDelayUntilScriptLoaded(InitNotifications, "sp.js");
var tid = setInterval(InitNotifications, 300000); // Reset notifications every 300 seconds or 5 minutes

SP.SOD.executeFunc('sp.js', 'SP.ClientContext', InitNotifications);

/* Initialize Client Context */
function InitNotifications() {
	var clientContext = new SP.ClientContext.get_current();
	//        var web = clientContext.get_web();
	var web = clientContext.get_site().get_rootWeb();
	var notificationsList = web.get_lists().getByTitle('Notifications');
	var camlQuery = new SP.CamlQuery();
	var q = "<View><Query>" +
		"<Where>" +
		"<Eq><FieldRef Name='Status' /><Value Type='Choice'>Active</Value></Eq>" +
		"</Where>" +
		"<OrderBy><FieldRef Name='Priority' Ascending='True' /></OrderBy>" +
		"</Query></View>";
	camlQuery.set_viewXml(q);
	this.notifications = notificationsList.getItems(camlQuery);
	clientContext.load(this.notifications, 'Include(Id,Title,Priority,Status)');
	clientContext.executeQueryAsync(Function.createDelegate(this, this.onNotificationsLoadSuccess), Function.createDelegate(this, this.onQueryFailed));
}

/* Function which runs if the async query succeeds */
function onNotificationsLoadSuccess(sender, args) {
	
	// CHECK - if on admin site, don't do anything
	if ( window.location.protocol == "https:" )
	{
		return;
	}
	
	var itemCount = notifications.get_count();
	if (itemCount > 0) {
		$("#pageStatusBar").empty();
		var listEnumerator = notifications.getEnumerator();
		while (listEnumerator.moveNext()) {
			var item = listEnumerator.get_current();
			var itemID = item.get_id();
			var itemName = item.get_item("Title");
			var itemPriority = item.get_item("Priority");
			var itemStatus = item.get_item("Status");

			var statusColor = ""
				if (itemPriority == "(1) Very Important")
					statusColor = "red";
				else if (itemPriority == "(2) Important")
					statusColor = "yellow";
				else if (itemPriority == "(3) Success")
					statusColor = "green";
				else if (itemPriority == "(4) Information")
					statusColor = "blue";

				var strStatusID = SP.UI.Status.addStatus(itemPriority.substring(4) + ":", itemName, false);
			SP.UI.Status.setStatusPriColor(strStatusID, statusColor);
		}
	} else {	
		SP.UI.Status.removeAllStatus(true);
	}
}

/* Function which runs if the async query fails */
function onQueryFailed(sender, args) {
	//alert('Request failed ' + args.get_message() + '\n' + args.get_stackTrace());
	console.log ( 'Request failed ' + args.get_message() + '\n' + args.get_stackTrace() ); 
}

function loadActualFundingGraphs(filter) {

	// Constants
	var DOMESTIC = "DOMESTIC";
	var INTERNATIONAL = "INTERNATIONAL";
	var INTERNAL_AWARDS = "Internal Awards";
	var EXTERNAL_AWARDS = "External Awards";
	var EMPLOYMENT_INCOME = "Employment Income";
	var RESEARCH_STIPEND = "Research Stipend";
	var OTHER_INCOME = "Other Income";
	
	var SMALL_ENROLMENT_VALUE = 5;
	
	// Creates structure for Funding Data object
	var FundingData = new Object();
	FundingData[ DOMESTIC ] = new Object();
	FundingData[ INTERNATIONAL ] = new Object();
	for ( var i = 0; i < Object.keys(FundingData).length; i++)
	{
		FundingData[ Object.keys(FundingData)[i] ] = { 
								Department: "",
								data: [ { label: INTERNAL_AWARDS, data:[ [0,1,false],[0,2,false],[0,3,false],[0,4,false],[0,5,false],[0,6,false],[0,7,false],[0,8,false],[0,9,false] ]  },
										{ label: EXTERNAL_AWARDS, data:[ [0,1,false],[0,2,false],[0,3,false],[0,4,false],[0,5,false],[0,6,false],[0,7,false],[0,8,false],[0,9,false] ]  },
										{ label: EMPLOYMENT_INCOME, data:[ [0,1,false],[0,2,false],[0,3,false],[0,4,false],[0,5,false],[0,6,false],[0,7,false],[0,8,false],[0,9,false] ] },
										{ label: RESEARCH_STIPEND, data:[ [0,1,false],[0,2,false],[0,3,false],[0,4,false],[0,5,false],[0,6,false],[0,7,false],[0,8,false],[0,9,false] ] },
										{ label: OTHER_INCOME, data:[ [0,1,false],[0,2,false],[0,3,false],[0,4,false],[0,5,false],[0,6,false],[0,7,false],[0,8,false],[0,9,false] ] }
									],
								TTC: -1,
								EnrolmentCount: -1,
								TuitionFees: -1
							};
	}
	/* 
	 * fundingTickFormatter
	 * - formats the axis labels for each tick mark for the funding charts
	 */
	function fundingTickFormatter(val, axis)
	{
		if ( (axis.direction == "x") && ( (val%10000) == 0 ) )
		{
			var re = '\\d(?=(\\d{' + 3 + '})+' + '$' + ')';
			return "$" + val.toFixed(0).replace(new RegExp(re, 'g'), '$&,');
		}
		else if ( (axis.direction == "y") && (val > 0) && (val < 10) )
		{
			return "Year " + val.toFixed(0);
		}
		
		return "";
	}


	/*
	 * getUrlParameter 
	 * - Helper function to grab parameter from URL
	 */
	function getUrlParameter(sParam) 
	{
		var sPageURL = decodeURIComponent(window.location.search.substring(1)),
			sURLVariables = sPageURL.split('&'),
			sParameterName,
			i;

		for (i = 0; i < sURLVariables.length; i++) 
		{
			sParameterName = sURLVariables[i].split('=');

			if (sParameterName[0] === sParam) 
			{
				return sParameterName[1] === undefined ? true : sParameterName[1];
			}
		}
	}

	/* parseData
	 * - Parses Funding Data received from aJax call to SharePoint List
	 */
	function parseData(data) 
	{
	
		for (var i = 0; i < data.length; i++)
		{
			if ( FundingData[ data[i].StudentType ].Department == "" )
			{
				FundingData[ data[i].StudentType ].Department = data[i].Department;
			}

			if ( FundingData[ data[i].StudentType ].TTC == -1 ) 
			{ 
				// CHECK - is TTC a number or an astrisk?
				if ( isNaN(data[i].TTC) )
				{
					FundingData[ data[i].StudentType ].TTC = data[i].TTC;  
				}
				else
				{
					FundingData[ data[i].StudentType ].TTC = Number(data[i].TTC).toFixed(2);  
				}
			} 
			
			
			if ( FundingData[ data[i].StudentType ].EnrolmentCount == -1 ) 
			{ 
				if ( isNaN(data[i].EnrollmentCount) )
				{
					FundingData[ data[i].StudentType ].EnrolmentCount = data[i].EnrolmentCount;  
				}
				else
				{
					FundingData[ data[i].StudentType ].EnrolmentCount = Number(data[i].EnrolmentCount).toFixed(0);  
				}
			}
				
			if ( FundingData[ data[i].StudentType ].TuitionFees == -1 )
			{ 
				FundingData[ data[i].StudentType ].TuitionFees = data[i].TuitionFees; 
			} 

			// CHECK - Is enrolment size large enough?  If it is too small, surpress data (set it to zero)
			// This is just a secondary precaution to protect privacy in case data is still in SharePoint list - data for small enrolment shoudl be set to 0
			
			var idx = data[i].Year - 1;
			
			if ( parseInt(FundingData[ data[i].StudentType ].EnrolmentCount.replace(/,/g, "")) >= SMALL_ENROLMENT_VALUE )
			{
			
				// Internal Awards
				if ( $.trim(data[i].InternalAwards) == "*")
				{
					FundingData[ data[i].StudentType ].data[ 0 ].data[idx][2] = true;
				}
				else
				{
					FundingData[ data[i].StudentType ].data[ 0 ].data[idx][2] = false;
				}
				
				// External Awards
				if ( $.trim(data[i].ExternalAwards) == "*" )
				{
					FundingData[ data[i].StudentType ].data[ 1 ].data[idx][2] = true;
				}
				else
				{
					FundingData[ data[i].StudentType ].data[ 1 ].data[idx][2] = false;
				}
				
				// Employment Income
				if ( $.trim(data[i].EmploymentIncome) == "*" )
				{
					FundingData[ data[i].StudentType ].data[ 2 ].data[idx][2] = true;
				}
				else
				{
					FundingData[ data[i].StudentType ].data[ 2 ].data[idx][2] = false;
				}
				
				// Research Stipend
				if ( $.trim(data[i].ResearchStipend) == "*" )
				{
					FundingData[ data[i].StudentType ].data[ 3 ].data[idx][2] = true;
				}
				else
				{
					FundingData[ data[i].StudentType ].data[ 3 ].data[idx][2] = false;
				}
				
				// Other Income
				if ( $.trim(data[i].OtherIncome) == "*" )
				{
					FundingData[ data[i].StudentType ].data[ 4 ].data[idx][2] = true;
				}
				else
				{
					FundingData[ data[i].StudentType ].data[ 4 ].data[idx][2] = false;
				}


				// Internal Awards
				try
				{
					FundingData[ data[i].StudentType ].data[ 0 ].data[idx][0] = Number(data[i].InternalAwards.replace(/[^0-9\.]+/g,"")).toFixed(2);
				}
				catch (err)
				{
					FundingData[ data[i].StudentType ].data[ 0 ].data[idx][0] = Number(0).toFixed(2);
				}

				
				// External Awards
				try
				{
					FundingData[ data[i].StudentType ].data[ 1 ].data[idx][0] = Number(data[i].ExternalAwards.replace(/[^0-9\.]+/g,"")).toFixed(2);
				}
				catch (err)
				{
					FundingData[ data[i].StudentType ].data[ 1 ].data[idx][0] = Number(0).toFixed(2);
				}
				
				// Employment Income
				try
				{
					FundingData[ data[i].StudentType ].data[ 2 ].data[idx][0] = Number(data[i].EmploymentIncome.replace(/[^0-9\.]+/g,"")).toFixed(2);
				}
				catch (err)
				{
					FundingData[ data[i].StudentType ].data[ 2 ].data[idx][0] = Number(0).toFixed(2);
				}
				
				// Research Stipend
				try
				{
					FundingData[ data[i].StudentType ].data[ 3 ].data[idx][0] = Number(data[i].ResearchStipend.replace(/[^0-9\.]+/g,"")).toFixed(2);
				}
				catch (err)
				{
					FundingData[ data[i].StudentType ].data[ 3 ].data[idx][0] = Number(0).toFixed(2);
				}					
				
				// Other Income
				try
				{
					FundingData[ data[i].StudentType ].data[ 4 ].data[idx][0] = Number(data[i].OtherIncome.replace(/[^0-9\.]+/g,"")).toFixed(2);
				}
				catch (err)					
				{
					FundingData[ data[i].StudentType ].data[ 4 ].data[idx][0] = Number(0).toFixed(2);
				
				}
			}
			else
			{
				for ( var j = 0; j < 5; j++)
				{
					FundingData[ data[i].StudentType ].data[ j ].data[idx][2] = true;
					FundingData[ data[i].StudentType ].data[ j ].data[idx][0] = 0;
				}
				
			}
		}

		// Enrolment
		//$("#enrolmentTotal").text( Number( FundingData[ DOMESTIC ].EnrolmentCount ) + Number( FundingData[ INTERNATIONAL ].EnrolmentCount ) );		
		var totalEnrolment = parseInt( FundingData[ DOMESTIC ].EnrolmentCount.replace(/,/g, "") ) + parseInt( FundingData[ INTERNATIONAL ].EnrolmentCount.replace(/,/g, "") );
		$("#enrolmentTotal").text( totalEnrolment.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")  );
		if ( parseInt(FundingData[ DOMESTIC ].EnrolmentCount.replace(/,/g, "")) >= SMALL_ENROLMENT_VALUE )
		{
			$("#enrolmentDomestic").text( FundingData[ DOMESTIC ].EnrolmentCount );
		}
		else
		{
			$("#enrolmentDomestic").html( "* (<a href='#Notes'>see Notes</a>)" );
		}
		
		if ( parseInt(FundingData[ INTERNATIONAL ].EnrolmentCount.replace(/,/g, "")) >= SMALL_ENROLMENT_VALUE )
		{
			$("#enrolmentInternational").text( FundingData[ INTERNATIONAL ].EnrolmentCount );
		}
		else
		{
			$("#enrolmentInternational").html( "* (<a href='#Notes'>see Notes</a>)" );
		}
		// TTC
		// - NOTE - this is a global value and is the same both Domestic and International.  We are simply using Domestic in this case.
		if ( isNaN( FundingData[ DOMESTIC ].TTC ) )
		{ 
			$("#TTC").html("* (<a href='#Notes'>see Notes</a>)" );
		}
		else
		{
			$("#TTC").text( FundingData[ DOMESTIC ].TTC ); 
		}

		// Tuition Fees
		//$("#tuitionDomestic").text( FundingData[ DOMESTIC ].TuitionFees );
		//$("#tuitionInternational").text( FundingData[ INTERNATIONAL ].TuitionFees );
		//$("#title").text( FundingData[ DOMESTIC ].Department );
		ReplaceElementValue($("#tuitionDomestic"), FundingData[ DOMESTIC ].TuitionFees);
		ReplaceElementValue($("#tuitionInternational"), FundingData[ INTERNATIONAL ].TuitionFees);
		ReplaceElementValue($("#title"), FundingData[ DOMESTIC ].Department);
		
		if (data[0].FacultyName != null) 
			ReplaceElementValue($(".FacultyName"), data[0].FacultyName);
		
		
		ReplaceAllHrefLinks(".FacultyBaseUrl", data[0].FacultyBaseFundingURL);		
		ReplaceElementValue($("#FacultyBaseUrl"), data[0].FacultyBaseFundingURL);
		ReplaceElementValue($("#ProgramUrl"), data[0].ProgramPageURL);
		ReplaceElementValue($("#UnitName"), data[0].Department);
		ReplaceElementValue($("#UnitActualUrl"), data[0].UnitActualFundingURL);
		
		if (data[0].PhDBaseFundingAmount == null)
			ReplaceElementValue($("#phdBaseFundAmt"), 'N/A');
		else
			ReplaceElementValue($("#phdBaseFundAmt"), data[0].PhDBaseFundingAmount);
		
				
		// Plot the charts
		plotChart("chartDomestic", FundingData[ DOMESTIC ].data );
		plotChart("chartInternational", FundingData[ INTERNATIONAL ].data );
	}


	$.fn.UseTooltip = function () {
	    $(this).bind("plothover", function (event, pos, item) {                         
	        if (item) {
	            if (previousPoint != item.dataIndex) {
	                previousPoint = item.dataIndex;
	 
	                $("#tooltip").remove();
	                 
	                var x = item.datapoint[0];
	                var y = item.datapoint[1];                
	 
	                console.log(x+","+y)
	 
	                showTooltip(item.pageX, item.pageY,
	                  months[x-  1] + "<br/>" + "<strong>" + y + "</strong> (" + item.series.label + ")");
	            }
	        }
	        else {
	            $("#tooltip").remove();
	            previousPoint = null;
	        }
	    });
	};
	function showTooltip(x, y, contents) {
	    $('<div id="tooltip">' + contents + '</div>').css({
	        position: 'absolute',
	        display: 'none',
	        top: y + 5,
	        left: x + 20,
	        border: '2px solid #4572A7',
	        padding: '2px',     
	        size: '10',   
	        'border-radius': '6px 6px 6px 6px',
	        'background-color': '#fff',
	        opacity: 0.80
	    }).appendTo("body").fadeIn(200);
	}


	function plotChart(chartName, data) 
	{
		var stack = 0, bars = true, lines = false, steps = false;
		var chart = $.plot("#"+chartName, data, 
		{
			series: {
				stack: true,
				bars: { 
					show: true, 
					barWidth: 0.6, 
					horizontal: true, 
					align: "center" 
					// fill: 1.0					
				},
				highlightColor: "rgba (0, 0, 0, 0.5)",
				/*
				valueLabels:
                {
                  show: false,
                  horizAlign: 'insideMax',
                  //font: "9pt 'Trebuchet MS'",
                  useBackground: false,
                  useBorder: false,
                  fontcolor: 'black',
                  useDecimalComma: false,
                  decimals: 2,
                  labelFormatter: function(val)
                  {
                     if ( val == 0 )
                     {
                     	return "";
                     }
                     else
                     {
						return "$" + val.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")

					 }
			         return "$" + val;
                  },
                }
                */
			},
			colors: ["#002A5C", "#6689CC", "#93B7D1", "#B7CCCC", "#A7B29A"],
			xaxis: {
				position: "bottom",
				min: 0,
				max: 60000,
				ticks: 12,
				tickDecimals: 0,
				tickFormatter: fundingTickFormatter,
				font: { weight: "bold", color: "#000000" }
			},
			yaxis: {
				transform: function(v){ return -v; }, 
				position: "left",
				min: 0,
				max: 10,
				ticks: 9,
					tickDecimals: 0,
				tickFormatter: fundingTickFormatter,
				font: { weight: "bold", color: "#000000" }
			},
			legend: { 
				noColumns: 4, 
				container: "#" + chartName + "Legend" 
			},
			grid: { 
				hoverable: true
			},
			/*
			tooltip: {
				show: true,
				content: "x: %x, y: %y"
			}
			*/
		});
		
		// Add surpressed data marks
		var ctx = chart.getCanvas().getContext("2d");
		var series = chart.getData();
		var offset = chart.getPlotOffset();
		ctx.fillStyle = "black";	
		ctx.font = "16px bold";
		for ( var i = 0; i < series[0].data.length; i++)
		{
			if ( series[0].data[i][2] == true )
			{
				var xPos = offset.left + 10;
				var yPos = chart.getYAxes()[0].p2c(series[0].data[i][1]) + offset.top + 8;
				ctx.fillText("*", xPos, yPos);
			}
		}					
	} // End plotChart
	

	$.ajax({
		url: "/_api/web/lists/getByTitle('SGSGradFundingActual')/items?$filter=OrgCd eq '"+filter+"'",
		type: "GET",
		headers: {
			accept: "application/json;odata=verbose"
		},
		success: function(data) {
			parseData(data.d.results);
		},
		error: function(data, errorCode, errorMessage) {
			console.log(errCode);
		}
	});

}

function ReplaceElementValue(element, value)
{
    if (element.length) {
		if (element[0].nodeName == 'A') {
			element.attr("href", value);
		} else {
			element.text(value);
		}
	}
}

function ReplaceAllHrefLinks(elementClass, value)
{
	$(elementClass).each(function()
		{
			$(this).attr("href", value);
		});
}

/** SYSTEM NOTIFICATIONS END ***********************************************************************************/

SP.SOD.executeFunc('sp.js', null, function() { getCurrentItem(pageInit) });

