script "LiveCodeMultiSearchStackBehavior"
--LiveCode Multi-Search - Andy piddock 11/2018
--v1.0.0

on preOpenSatck
   
   put empty into fld "Search"
   
   --setup Navigation Bar - segmented control widget
   local tNumberList
   local tNamesList
   local tLabelsList
   
   set the itemCount of widget "NavigationBar" to 7
      
   put "100,100,100,100,100,100,100" into tNumberList
   put "LC Forum,Nabble Forum,StackOverflow,LC Dictionary,LC Lessons,GitHub,GitHub Gist" into tNamesList
   put "LC Forum,Nabble Forum,StackOverflow,LC Dictionary,LC Lessons,GitHub,GitHub Gist" into tLabelsList
   
   set the width of widget "NavigationBar" to the number of items of tNamesList * 100
   
   set the itemMinExtents of widget "NavigationBar" to tNumberList
   set the itemNames of widget "NavigationBar" to tNamesList
   set the itemLabels of widget "NavigationBar" to tLabelsList
   
   set the left of widget "NavigationBar" to the left of card "Main" +80
   
end preOpenSatck


on browserNavigateBegin pUrl
   set the visible of widget "Spinner" to true 
   put "searching / loading...." into fld "Status"
end browserNavigateBegin

on browserNavigateComplete pUrl
   set the visible of widget "Spinner" to false 
   put empty into fld "Status"   
end browserNavigateComplete
