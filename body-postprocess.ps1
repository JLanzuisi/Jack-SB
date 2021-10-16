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
	-replace 'I wanted to say no,',"I wanted to say no,`n`n\enlargethispage{-2\baselineskip}" `
)	| Set-Content -Path .\body.tex