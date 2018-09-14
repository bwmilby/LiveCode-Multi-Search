# LiveCode-Multi-Search

**One Search box Seven sites searched**
Search across
LiveCode Forum, Nabble Forum, StackOverflow, LiveCode Dictionary, LiveCode Lessons, GitHub and Github Gists all from one search box!

Filter Gist reults by extension
Traverse back and forward through your searches

The online dictionary was created using the WebDocMaker by 
Brian Milby https://github.com/bwmilby/lc-misc/tree/master/WebDocMaker
the output modified to accept url perameters.

As is the online dictionary is on my hosting. If you would like to have your own hosted dictionary, then generate the files using WebDocMaker and then at the end of the api.html file, replace

<script charset="UTF-8" src="./builtapi.js"></script>  
	<script src="./js/dictionaryfunctions.js"></script>	
	<script>
		$(document).ready(function(e)
		{
			setEdition('commercial');
			setActions();
			dataFilter();
			displayLibraryChooser();
			
			goEntryName('tLibraryName', 'tEntryName', 'tEntryType');
			document.getElementById("uifiler").focus();
		});
	</script>
  
  with
  
<script>
function getURLParameter(e) {
  return decodeURI((new RegExp(e + "=(.+?)(&|$)").exec(location.search) || [, ""])[1]);
}

if (getURLParameter("search") === "") {
  console.log("No URL param value found.");
} else {


document.getElementById("uifiler").value = getURLParameter("search");
}
</script>

<script>
$(document).ready(function() {

setEdition('commercial');
            setActions();
            dataFilter();
            displayLibraryChooser();

            goEntryName('tLibraryName', 'tEntryName', 'tEntryType');
            document.getElementById("uifiler").focus();
            $('#uifiler').keyup();


});
</script>

to allow passing of the search perameters and to force trigger the keyup event in the search input field.

You will also need to change the url here

--LC Dictionary
   put "https://2108.co.uk/LCDict/api.html?search=" & fld "Search" into tSearchLCDict
   set the url of widget "Browser LC Dictionary" to tSearchLCDict
   
which can be found in the maingroupid1032searchbuttonbehavior.livecodescript file
