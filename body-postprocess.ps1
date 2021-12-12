# This script changes a couple of things needed for the PDF to look
# correctly and also takes care of overfull boxes.
# Note that the replaces that add a \linebreak need to be checked
# whenever the text changes.
((Get-Content -Path .\body.tex) `
	-replace '^\\part\*{Introduction}','\part*{Introduc\kern1pt tion}' `
	-replace '(^\\part{.*})','$1\setcounter{chapter}{0}' `
	-replace "forehead---I'd never","fore\-head---I'd never" `
	-replace 'forklift driver. ``Charge','forklift driver. \linebreak ``Charge' `
	-replace 'possibility---no worse punishment','pos\-si\-bil\-i\-ty---no worse punishment' `
	-replace 'guided by my compass---','guided by my com\-pass---' `
	-replace 'and my great-grandfather.','and my great-grand\-fa\-ther.' `
	-replace 'caramel whipped-creamed','caramel whipped\--\-creamed' `
	-replace 'monogrammed handkerchief. ``Maybe','monogrammed handkerchief. \linebreak ``Maybe' `
	-replace 'inboard/outboards, 550','\linebreak inboard/outboards, 550' `
	-replace "Route 93. ````Wouldn't it","Route 93. \linebreak ````Wouldn't it" `
	-replace "something---there's","some\-thing---there's" `
	-replace 'predetermined---','pre\-de\-ter\-mined---' `
	-replace 'confidence---','con\-fi\-dence---' `
	-replace 'Lawrence, one','\linebreak Lawrence, one' `
	-replace 'Joanna wrapped herself','Joanna \linebreak wrapped herself' `
	-replace "She's awake.","\linebreak She's awake." `
	-replace 'parsley---','pars\-ley---' `
	-replace 'I wanted to say no,',"\enlargethispage{1\baselineskip}`n`n I wanted to say no," `
	-replace '3:25.','\hspace{\parindent}3:25.' `
	-replace '``Hey, Walter,','\hspace*{\parindent}``Hey, Walter,' `
	-replace 'Lake: Meredith','Lake: Mere\-dith'  `
	-replace '"Every Sunday, mid-May','``Every Sunday, mid-May' `
	-replace '"Every Sunday, mid-May','``Every Sunday, mid-May' `
	-replace '"Stock it with eggs,','``Stock it with eggs,' `
	-replace '"Even that might not','``Even that might not' `
	-replace '"The third night,','``The third night,' `
	-replace '"And yes, God was definitely','``And yes, God was definitely' `
	-replace '"She slammed the door,','``She slammed the door,' `
	-replace '"That hospital was like','``That hospital was like' `
	-replace '"They put me on high','``They put me on high' `
	-replace 'muttered. "The Fab','muttered. ``The Fab' `
	-replace "'Dear Robert---","`Dear Robert---" `
	-replace '"They assumed that','``They assumed that' `
	-replace '"So I wrote my own letter','``So I wrote my own letter' `
	-replace '"I mailed, emailed, texted,','``I mailed, emailed, texted,' `
	-replace '"Last Saturday I happened','``Last Saturday I happened' `
	-replace '"I was in the woods','``I was in the woods' `
	-replace '"My senior year in high school,','``My senior year in high school,' `
	-replace '"I always knew that I was different','``I always knew that I was different' `
	-replace '"Suddenly my father yelled from','``Suddenly my father yelled from' `
	-replace '"My father then led us to the garage,','``My father then led us to the garage,' `
	-replace '"We are born like this;','``We are born like this;' `
	-replace '"The last year of my marriage,','``The last year of my marriage,' `
	-replace '"So what? They own us.','``So what? They own us.' `
	-replace '"Zachary wants the concrete','``Zachary wants the concrete' `
	-replace '"*She*? the bank','``*She*? the bank' `
	-replace '"Alexander, sometimes you can be so annoying.','``Alexander, sometimes you can be so annoying.' `
	-replace '"Twenty-five feet. The','``Twenty-five feet. The' `
	-replace '"completing her nursing internship','``completing her nursing internship' `
	-replace 'I was calling at 8.45 PM','I was calling at \liningnums{8.45} PM' `
	-replace '','' `
	-replace '','' `
	-replace '','' `
)	| Set-Content -Path .\body.tex
