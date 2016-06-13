macroScript Simple_IndividualFBX
Category: "Arif_Export"
toolTip:"individualFBX_export"
buttonText:"individualFBX_export"
--header

			(
				
makeDir (maxFilePath + "FBX")


				
				selObjsArr = selection as array
	--for m in selObjsArr do
		FOR m in selObjsArr WHERE isGroupHead m DO 
	(
--	if m.surfsubdivide == true then m.surfSubdivide = off 
		select m
		--temporarily remove nurms
		
		sel = selection[1]
/*
		ch = sel.children  

		selectmore ch   --selecthecildren function
	*/
	
		    curObject  = m
    curObjectName = m.name
curObjectPos = curObject.position
		
		
		    -- Moves the object to the world 0 0 0 node
    curObject.pos = [0,0,0] 
		

	
FBXExporterGetParam "FBXProperties"
	FBXExporterSetParam "TangentSpaceExport"	 True
	FBXExporterSetParam "SmoothingGroups"	 True
	FBXExporterSetParam  "UpAxis"	"Z"
	FBXExporterSetParam  "ConvertUnit" "cm"
	FBXExporterSetParam  "FileVersion" "FBX201300"
--	FBXExporterSetParam  "Triangulate"	 True
	
	-- note : if there is crash or error, some of the geo is corrupted or has broken triangulation, fix it by converting to mesh then converting it to poly again. ( this is temporary fix)
	

	theClasses =exporterPlugin.classes
		exportFile ( maxFilePath + "FBX/" + curObjectName + ".fbx" ) #noPrompt selectedOnly:True using:FBXEXP
		
		  -- moves object back to original position
 move curObject curObjectPos 
		
	)
	
	FOR m in selObjsArr where isGroupHead m == false and isGroupmember m == false Do 
		(
	--	if m.surfsubdivide == true then m.surfSubdivide = off 
		select m
			
		sel = selection[1]
/*
		ch = sel.children  

		selectmore ch   --selecthecildren function
	*/
	
		    curObject  = m
    curObjectName = m.name
curObjectPos = curObject.position
		
		
		    -- Moves the object to the world 0 0 0 node
    curObject.pos = [0,0,0] 
		

	
FBXExporterGetParam "FBXProperties"
	FBXExporterSetParam "TangentSpaceExport"	 True
	FBXExporterSetParam "SmoothingGroups"	 True
	FBXExporterSetParam  "UpAxis"	"Z"
	FBXExporterSetParam  "ConvertUnit" "cm"
	FBXExporterSetParam  "FileVersion" "FBX201300"
--	FBXExporterSetParam  "Triangulate"	 True
	
	-- note : if there is crash or error, some of the geo is corrupted or has broken triangulation, fix it by converting to mesh then converting it to poly again. ( this is temporary fix)
	

	theClasses =exporterPlugin.classes
		exportFile ( maxFilePath + "FBX/" + curObjectName + ".fbx" ) #noPrompt selectedOnly:True using:FBXEXP
		
		  -- moves object back to original position
 move curObject curObjectPos 
		
	)
	
)
