
macroScript ToggleOBJlocktransform
	category: "Arif_Model"
	buttonText:"Lock/Unlock"
	toolTip:"Lock/Unlock"

(

_GetLockTranform =  getTransformLockFlags selection[1] as string 

if _GetLockTranform  == "#{}" 
	 then  ( for i in selection do  setTransformLockFlags i #all; messagebox "Locked" )
		 else  ( for i in selection do setTransformLockFlags i  #none;  messagebox "Unlocked" )
			 


)
